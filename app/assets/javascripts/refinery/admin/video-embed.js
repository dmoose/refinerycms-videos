// Embed Video
EmbedVideo = {};

EmbedVideo.sampleCode = '<div class="embed-video">'
    + '<a href="#" data-item-type="video" data-video-sources="/system/videos/2012/02/02/23_06_48_657_heli.mp4,/system/videos/2012/02/02/23_06_45_420_heli.webm,/system/videos/2012/02/02/23_06_34_928_heli.ogv" title="Helicopter">'
    + '<div class="video-watermark"></div>'
    + '<img alt="Tera_wallpaper_08_apr2010_1920x1080" src="/system/images/BAhbB1sHOgZmSSJEMjAxMi8wMi8wNy8yMF8wM181Nl83NjJfVEVSQV9XYWxscGFwZXJfMDhfYXByMjAxMF8xOTIweDEwODAuanBnBjoGRVRbCDoGcDoKdGh1bWJJIg4yMDB4MjAwI2MGOwZU/TERA_Wallpaper_08_apr2010_1920x1080">'
    + '<span class="video-link">Helicopter</span></a></div>';

EmbedVideo.addVideoButtonHtml = "<li class='wym_tools_add_video'><a href='/refinery/videos/insert?callback=video_added' class='add_video_link'>Add Video</a></li>";
  
EmbedVideo.addEmbedVideoButton = function(wym){
  $(wym._box).find('.wym_tools_image').after(EmbedVideo.addVideoButtonHtml);
  console.log(wym);
  console.log("added button listener here.")
  $(wym._box).find('.wym_tools_add_video').click(function(e) {
    e.preventDefault();
    wym.insert(EmbedVideo.sampleCode);
    return(false);
  });
}
  
EmbedVideo.initVideoButtons = function(){
  WYMeditor.INSTANCES.forEach(function(wym){EmbedVideo.addEmbedVideoButton(wym)});
}

$(function(){
  setTimeout(EmbedVideo.initVideoButtons, 333);
});
