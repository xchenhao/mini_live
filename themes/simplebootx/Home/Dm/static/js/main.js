/**验证码*/
//点击图片刷新
$(".input-captcha img").click(function(){
    $.captcha.refresh();
});

//验证码
$.captcha = {
    //刷新验证码
    refresh:function () {
        $.ajax({
            url:'/captcha/refresh/?hashkey=' + $(".input-captcha input[type=hidden]").attr("value"),
            type:'get',
            success:function (result) {
                $('.input-captcha img').attr("src",result);
                $('.input-captcha input[type=hidden]').attr('value', result.split('/')[3]);
            },
            error:function (data) {
                console.log(data);
                $.message_app.message('error','刷新验证码错误');
            }
        })
    },
}

//导航栏
$.navbar = {
    init:function(){
        //菜单悬浮
        $.navbar.menu_hover();
        //激活导航菜单
        $.navbar.navbar_active();
        //激活文章页分类
        $.navbar.article_categories_active();
        //侧边栏
        $.navbar.sidebar_init();
    },
    mobile_toggle: function () {
        $(".mobile .content").toggle(200);
    },
    //一级菜单悬浮，显示二级菜单
    menu_hover:function () {
        if($(window).width() > 768){
            $(".pagenav li.dropdown").hover(function () {
                var dropdown_menu = $(this).find(".dropdown-menu");
                $(dropdown_menu).stop();
                $(this).find(".dropdown-menu").slideDown(300);
            }, function () {
                var dropdown_menu = $(this).find(".dropdown-menu");
                $(dropdown_menu).stop();
                $(this).find(".dropdown-menu").slideUp(300);
            })
        }
    },
    //文章顶部分类active
    article_categories_active:function () {
        //移出active
        $(".article-category-list a").removeClass('active');
        //active
        $(".article-category-list a").each(function () {
            if(window.location.pathname == $(this).attr("_id")){
                $(this).addClass('active');
            }
        })
    },
    //导航栏active
    navbar_active:function () {
        //移出active
        $(".pagenav .nav-item").removeClass('active');
        //active
        $(".pagenav .nav-item").each(function () {
            if(window.location.pathname == $(this).attr("_id")){
                $(this).addClass('active');
            }
        })
    },
    //侧边栏
    sidebar_init:function () {
        var scrollTop = parseInt($(window).scrollTop());
        if(scrollTop > 100){
            $(".scroll-to-top").show();
        }else{
            $(".scroll-to-top").hide();
        }
    }
}
//搜索框
$.search = {
    search:function () {
        $("#searchBtn").click(function(){
            var keywords = $("#searchInput").val();
            if(!keywords){
                $.message_app.message('error', '请输入您要搜索的内容');
            }else{
                window.location.href = "/article/search/" + keywords + "/";
            }
        });
        $(".searchBtn").click(function(){
            var keywords = $(this).parent().parent().find('input.searchInput').val();
            if(!keywords){
                $.message_app.message('error', '请输入您要搜索的内容');
            }else{
                window.location.href = "/article/search/" + keywords + "/";
            }
        });
    }
}

//滚动到顶部
function scrollToPosition(position) {
    $('html,body').animate({scrollTop:position},'slow');
}

//文档加载完毕
$(document).ready(function () {
    //导航栏
    $.navbar.init();
    //搜索
    $.search.search();
    //窗体滚动事件
    $(window).scroll(function () {
        $.navbar.sidebar_init();
    })
})