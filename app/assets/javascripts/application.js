// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
$.fn.typewriter = function() {
        this.each(function() {
            var $ele = $(this), str = $ele.html(), progress = 0, offset = 0;
            $ele.html('');
            var typewriting = function() {

              if(str.substring(progress, progress + 1) == "<"){
                var re = new RegExp(/<span class="instant"/);
                var cl = new RegExp(/<span class="clear"/);
                if (str.substring(progress,str.length).match(re)) {
                  progress += str.substring(progress,str.length).indexOf('</span>')+7;
                }else if(str.substring(progress,str.length).match(cl)){
                  offset = progress;
                  progress += str.substring(progress,str.length).indexOf('</span>')+7;


                }else{
                while(str.substring(progress, progress + 1) != ">"){
                  progress++;
                }
                }
              }

                $ele.html(str.substring(offset, progress++) + (progress & 1 ? '_' : ''));
              if (progress >= str.length){
                return;
              }
              else{
                setTimeout(typewriting, 10 + Math.random()*100);
              }
            }
            typewriting();
        });
        return this;
    };
$('#terminal').typewriter();
});
