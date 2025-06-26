import json
from talon.types.point import Point2d
from .constants import POINT_FILES_DIR


def sanitize_app_name(name: str) -> str:
    """Convert a spoken phrase / app name to a safe filename (lowercase, alphanumeric)."""
    return "".join(ch for ch in name.lower() if ch.isalnum())


def _file_for(app_name: str):
    """Get the file path for a given app name."""
    return POINT_FILES_DIR / f"{sanitize_app_name(app_name)}.json"


def load_points_for(app_name: str):
    """Load points from JSON file for the given app name."""
    path = _file_for(app_name)
    if not path.exists():
        return {}
    
    try:
        data = json.loads(path.read_text())
        # Convert coordinate arrays back to Point2d objects
        return {k: [Point2d(xy[0], xy[1]) for xy in v] for k, v in data.items()}
    except (json.JSONDecodeError, KeyError, IndexError) as e:
        print(f"Error loading points file {path}: {e}")
        return {}


def save_points_for(app_name: str, points_map):
    """Save points to JSON file for the given app name."""
    # Convert Point2d objects to serializable coordinate arrays
    serializable = {k: [[p.x, p.y] for p in point_list] for k, point_list in points_map.items()}
    
    try:
        _file_for(app_name).write_text(json.dumps(serializable, indent=2))
    except Exception as e:
        print(f"Error saving points file for {app_name}: {e}")


def list_available_point_files():
    """List all available point files."""
    return [f.stem for f in POINT_FILES_DIR.glob("*.json")] 