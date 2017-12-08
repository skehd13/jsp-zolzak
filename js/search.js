function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}
// 시작시
var searchkey;
$(document).ready(function(){

});
function search() {
  $(".mainitem").remove();
  $(".item").remove();
  searchkey = $("#title").val();
  var q = searchkey;
  console.log(searchkey);
  var request = gapi.client.youtube.search.list({
    part: "snippet",
    q: searchkey
  });
  request.execute(function(response){
    var result = response.result;
    $.each(result.items, function(index, item){
      console.log(index);
      console.log(item);
      $("#item"+index).html(item.snippet.title);
      $("#item"+index+"desc").html(item.snippet.description);
      $("#item"+index+"link").html(item.snippet.title).attr({
        "href":"//www.youtube.com/embed/"+item.id.videoId
      });
    startmind();
    });
  });
};
function search2(key) {
  $(".mainitem").remove();
  $(".item").remove();
  searchkey = key;
  var q = searchkey;
  console.log(key);
  var request = gapi.client.youtube.search.list({
    part: "snippet",
    q: searchkey
  });
  request.execute(function(response){
    var result = response.result;
    $.each(result.items, function(index, item){
      console.log(index);
      console.log(item);
      $("#item"+index).html(item.snippet.title);
      $("#item"+index+"desc").html(item.snippet.description);
      $("#item"+index+"link").html(item.snippet.title).attr({
        "href":"//www.youtube.com/embed/"+item.id.videoId
      });
    startmind();
    });
  });
};

function startmind(){
  $(".node").remove();
  $("path").remove();
    // body에서 마인드맵을 사용한다.
    $('body').mindmap();
    // 마인드맵에 데이터 추가
    // var title = $('#title').val();
    var root;
    console.log(searchkey);
    $('h1').each(function() {
      root = $('body').addRootNode($(this).text(), {
          href:'/',
          url:'/',
          onclick:function(node) {
              $(node.obj.activeNode.content).each(function() {
                  this.hide();
              });
              $(node.content).each(function() {
                  this.show();
              });
          }
      });
      $(this).hide();
    })

    $('h2').each(function() {
        var mynode = $('body').addNode(root, $(this).text(), {
            href:$(this).text().toLowerCase(),
            onclick:function(node) {
                $(node.obj.activeNode.content).each(function() {
                    this.hide();
                });
                $(node.content).each(function() {
                    this.show();
                });
            }
        });
        $(this).hide();
        var parentnode = mynode;
        for (var $el = $(this).next(); $el.length>0; $el = $el.next()) {
            if ($el[0].tagName=="svg") break;
            if ($el[0].tagName=="H2") break;
            switch($el[0].tagName) {
                case 'H3':
                    parentnode = $('body').addNode(mynode, $el.text(), {
                        href:$(this).text().toLowerCase(),
                        onclick:function(node) {
                            $(node.obj.activeNode.content).each(function() {
                                this.hide();
                            });
                            $(node.content).each(function() {
                                this.show();
                            });
                        }
                    });
                    $el.hide();
                break;
                default:
                    parentnode.content.push($el);
                    $el.hide();
                break;
            }
        }
    });
};

function init() {
  gapi.client.setApiKey("AIzaSyDKIokVzmgtUYt2KEMR-YKSnsaoZkJdX84");
  gapi.client.load("youtube", "v3", function() {
      //Api사용할 준비를 한다.
      console.log("connect API");
      //
      searchkey = $("#title").val();
      if (searchkey != "") {
        search();
      }
  });
}
