#!/usr/bin/env bash
# 启动 apps/festival_greetings（Flutter dev/prod）
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT/apps/festival_greetings"

FLAVOR="${FLAVOR:-dev}"
DEVICE=""
BOOT_SIMULATOR=true

usage() {
  cat <<'EOF'
用法: scripts/run_app.sh [选项]

选项:
  -f, --flavor <dev|prod>   构建变体（默认 dev）
  -d, --device <id>         指定设备 ID（flutter devices 查看）
  --no-simulator            不自动启动 iOS 模拟器
  -h, --help                显示帮助

示例:
  ./scripts/run_app.sh
  ./scripts/run_app.sh -f prod
  ./scripts/run_app.sh -d chrome
  FLAVOR=dev ./scripts/run_app.sh -d 5D5AF02A-10E6-4C9C-82E8-161E035933DA
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--flavor)
      FLAVOR="$2"
      shift 2
      ;;
    -d|--device)
      DEVICE="$2"
      shift 2
      ;;
    --no-simulator)
      BOOT_SIMULATOR=false
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "未知参数: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ "$FLAVOR" != "dev" && "$FLAVOR" != "prod" ]]; then
  echo "错误: flavor 必须是 dev 或 prod，当前为 '$FLAVOR'" >&2
  exit 1
fi

DART_DEFINES="$APP_DIR/dart_defines.${FLAVOR}.json"
if [[ ! -f "$DART_DEFINES" ]]; then
  echo "错误: 找不到 $DART_DEFINES" >&2
  exit 1
fi

boot_ios_simulator_if_needed() {
  if [[ "$BOOT_SIMULATOR" != true ]]; then
    return
  fi
  if [[ -n "$DEVICE" && "$DEVICE" != ios* ]]; then
    return
  fi
  if flutter devices 2>/dev/null | grep -q '• ios'; then
    return
  fi
  if ! command -v xcrun >/dev/null 2>&1; then
    return
  fi

  local sim_id
  sim_id="$(xcrun simctl list devices available 2>/dev/null \
    | awk -F '[()]' '/iPhone/ && !/unavailable/ { print $2; exit }')"
  if [[ -z "$sim_id" ]]; then
    echo "警告: 未找到可用 iOS 模拟器，将使用 Flutter 默认设备" >&2
    return
  fi

  echo "→ 启动 iOS 模拟器 ($sim_id) ..."
  xcrun simctl boot "$sim_id" 2>/dev/null || true
  open -a Simulator 2>/dev/null || true
  sleep 2
}

ensure_ios_pods() {
  if [[ ! -d "$APP_DIR/ios" ]]; then
    return
  fi
  if [[ -n "$DEVICE" && "$DEVICE" != *ios* && "$DEVICE" != "macos" ]]; then
    case "$DEVICE" in
      chrome|web*) return ;;
    esac
  fi
  if ! command -v pod >/dev/null 2>&1; then
    return
  fi
  echo "→ pod install (ios) ..."
  (cd "$APP_DIR/ios" && pod install)
}

echo "→ 项目目录: $APP_DIR"
cd "$APP_DIR"

echo "→ flutter pub get ..."
flutter pub get

boot_ios_simulator_if_needed
ensure_ios_pods

RUN_ARGS=(
  run
  --flavor "$FLAVOR"
  "--dart-define-from-file=$DART_DEFINES"
)

if [[ -n "$DEVICE" ]]; then
  RUN_ARGS+=(-d "$DEVICE")
fi

echo "→ flutter ${RUN_ARGS[*]}"
exec flutter "${RUN_ARGS[@]}"
