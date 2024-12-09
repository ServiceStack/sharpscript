$('.lang-select').each(function(){
    var qs = queryStringParams();
    var lang = qs['lang'] || 'template';
    var el = $(this);
    el.find("input[type=radio]").on("change", function(){
        qs['lang'] = this.id === 'template' ? null : this.id;
        var url = location.href.split('?')[0];
        for (var k in qs) {
            if (!qs[k]) continue;
            url += url.indexOf('?' >= 0) ? "?" : "&";
            url += k + "=" + encodeURIComponent(qs[k]);
        }
        location.href = url;
    });
    el.find("input[type=radio]").each(function() {
        this.checked = this.id === lang;
        if (this.checked)
            $(this).parents("label").addClass('active');
        else
            $(this).parents("label").removeClass('active');
    })
})

$(".live-pages").each(function(){

    var el = $(this)
    el.find("textarea").on("input", function(){
        var page = el.data("page")
        var files = {}

        el.find(".files section").each(function(){
            var name = $.trim($(this).find("h5").html())
            var contents = $(this).find("textarea").val()
            files[name] = contents
        })

        var request = { files: files, page: page }

        $.ajax({
            type: "POST",
            url: "/pages/eval",
            data: JSON.stringify(request),
            contentType: "application/json",
            dataType: "html"
        }).done(function(data){
            el.removeClass('error').find(".output").html(data)
        }).fail(function(jqxhr){ handleError(el, jqxhr) })
    })
    .trigger("input")

})

$(".live-template").each(function(){

    var el = $(this)
    el.find("textarea").on("input", function(){

        var request = { template: el.find("textarea").val() }

        $.ajax({
            type: "POST",
            url: "/template/eval" + location.search,
            data: JSON.stringify(request),
            contentType: "application/json",
            dataType: "html"
        }).done(function(data){
            el.removeClass('error').find(".output").html(data)
        }).fail(function(jqxhr){ handleError(el, jqxhr) })
    })
    .trigger("input")

})

$(".linq-preview").each(function(){
    var files = {}

    var el = $(this)
    var lang = $(this).data('lang');
    el.find("textarea").on("input", function(){
        var files = {}

        el.find(".files section").each(function(){
            var name = $.trim($(this).find("h5").html())
            var contents = $(this).find("textarea").val()
            files[name] = contents
        })

        var request = { code: el.find(".template textarea").val(), files: files }
        var qsLang = lang ? "?lang=" + lang : "";

        $.ajax({
            type: "POST",
            url: "/linq/eval" + qsLang,
            data: JSON.stringify(request),
            contentType: "application/json",
            dataType: "html"
        }).done(function(data){
            el.removeClass('error').find(".output").html(data);
        }).fail(function(jqxhr){ handleError(el, jqxhr) })
    })
    .trigger("input")

})

$("#content h2,#content h3,#content h4").each(function(){
    var el = $(this);

    var text = el.html();
    if (text.indexOf("<") >= 0) return;

    if (!el.attr('id')) {
        var safeName = text.toLowerCase().replace(/\s+/g, "-").replace(/[^a-zA-Z0-9_-]+/g,"")
        el.attr('id', safeName)
    }

    el.on('click', function(){
        var id = el.attr('id')
        location.href = "#" + id
    })
})

$.fn.ajaxPreview = function(opt) {
    var inputs = this.find("input,textarea");
    inputs.on("input", function(){
        var f = $(this).closest("form");
        var data = {};
        inputs.each(function(){ data[this.name] = this.value })
        $.ajax({ 
            url: f.attr('action'),
            method: "POST",
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: opt.dataType || 'json',
            success: opt.success,
            error: opt.error || function(jqxhr,status,errMsg) { handleError(el, jqxhr) }
        })
    })
    .first().trigger("input")

    return this.each(function(){ 
        $(this).submit(function(e){ e.preventDefault() }) 
    });
}

function handleError(el, jqxhr) {
    try {
        console.log('template error:', jqxhr.status, jqxhr.statusText)
        el.addClass('error')
        var errorResponse = JSON.parse(jqxhr.responseText);
        var status = errorResponse.responseStatus;
        if (status) {
            el.find('.output').html('<div class="alert alert-danger"><pre>' + status.errorCode + ' ' + status.message +
             '\n\nStackTrace:\n' + status.stackTrace + '</pre></div>')
        }
    } catch(e) {
        el.find('.output').html('<div class="alert alert-danger"><pre>' + jqxhr.status + ' ' + jqxhr.statusText + '</pre></div>')
    }
}

function queryStringParams(qs) {
    qs = (qs || document.location.search).split('+').join(' ')
    var params = {}, tokens, re = /[?&]?([^=]+)=([^&]*)/g
    while (tokens = re.exec(qs)) {
        params[tokens[1]] = tokens[2];
    }
    return params;
}


function video(url) {
    return '<iframe style="width:100%;min-height:585px" src="' + url + '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
}
function playVideo(el,id) {
    var url = 'https://www.youtube.com/embed/' + id + '?autoplay=1';
    $(el).parent().html(video(url));
}

function splitOnFirst(s, c) {
    if (!s) return [s];
    var pos = s.indexOf(c);
    return pos >= 0 ? [s.substring(0, pos), s.substring(pos + 1)] : [s];
}
function splitOnLast(s, c) {
    if (!s) return [s];
    var pos = s.lastIndexOf(c);
    return pos >= 0
        ? [s.substring(0, pos), s.substring(pos + 1)]
        : [s];
}
function preloadImage(src) {
    var img = new Image();
    img.src = src;
}

function bindYouTubePlay(img) {
    var a = img.parent();
    var p = a.parent();
    if (p[0] && p[0].tagName === 'P') {
        var id = splitOnFirst(splitOnLast(a.attr('href'),'/')[1],'?')[0];
        var width = Math.floor(img[0].offsetWidth/2 - 43);
        var height = Math.floor(img[0].offsetHeight/2 - 31);
        var html = `<i class="youtube-play" style="width:${img[0].offsetWidth}px;height:${img[0].offsetHeight}px;background-position:${width}px ${height}px" onclick="playVideo(this,'${id}')"></i>`;
        p.prepend(html);
    }
}

function bindYouTubeImages() {
    preloadImage('/images/youtube-play-hover.png');
    $("a[href^='https://youtu.be/']>img").each(function() {
        if (this.complete) {
            bindYouTubePlay($(this));
        } else {
            this.onload = function() { bindYouTubePlay($(this)); }
        }
    });
}

$(bindYouTubeImages);

$(function(){
    $("a[name*='app://']").each(function() {
        this.href = 'app://' + splitOnFirst(this.getAttribute('name'), '://')[1];
    });
    $(".gfm h2 .anchor,.gfm h3 .anchor,.gfm h4 .anchor").each(function() {
        var href = this.href;
        if (!href) return;
        var h = $(this).parent();
        h.addClass('h-link');
        h.on('click', function() { location.href = href; });
    })
});
