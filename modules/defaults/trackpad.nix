{ ... }:

{
  system.defaults.trackpad = {
    # Enable three-finger drag.
    TrackpadThreeFingerDrag = true;

    # Enable four-finger swiping between full-screen applications.
    TrackpadFourFingerHorizSwipeGesture = 2;

    # Enable four-finger vertical swipe gestures.
    TrackpadFourFingerVertSwipeGesture = 2;
  };

  system.defaults.dock = {
    # Enable the Mission Control trackpad gesture.
    showMissionControlGestureEnabled = true;

    # Enable the App Exposé trackpad gesture.
    showAppExposeGestureEnabled = true;
  };
}
