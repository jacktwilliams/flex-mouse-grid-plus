from pathlib import Path

# Directory where point files are stored
POINT_FILES_DIR = Path.home() / ".talon" / "flex_points"
POINT_FILES_DIR.mkdir(parents=True, exist_ok=True) 