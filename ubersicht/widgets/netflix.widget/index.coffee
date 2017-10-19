# github.com/seansu4you87
# This was useful for video positioning
# - https://slicejack.com/fullscreen-html5-video-background-css/
#
# Here is original inspiration:
# - https://www.reddit.com/r/Ubersicht/comments/70nmgi/resource_friendly_animated_wallpaper/

command: "",
refreshFrequency: false,
render: -> """
<div class="fullscreen-bg">
  <video no-controls loop autoplay
         class="video-aspect"
         src="./netflix.widget/current.mp4">
  </video>
</div>
"""
style: """

  width: 100%
  height: 100%
  background-size: cover
  object-fit: contain
  background-color: black
  z-index: -1000

  .fullscreen-bg
    position: fixed
    top: 0
    right: 0
    bottom: 0
    left: 0
    overflow: hidden

  .video-aspect
    position: absolute
    top: 0
    left: -10%
    width: 120%
    height: 100%

  .video-fullscreen
    min-width: 100%
    min-height: 100%
    object-fit: contain

"""
update: (output, domEl) ->

