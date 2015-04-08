// ------------------------------
// Browser Detection Plugin
// https://github.com/gabceb/jquery-browser-plugin/
// ------------------------------
!function(a,b){"use strict";var c,d;if(a.uaMatch=function(a){a=a.toLowerCase();var b=/(opr)[\/]([\w.]+)/.exec(a)||/(chrome)[ \/]([\w.]+)/.exec(a)||/(version)[ \/]([\w.]+).*(safari)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||a.indexOf("trident")>=0&&/(rv)(?::| )([\w.]+)/.exec(a)||a.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(a)||[],c=/(ipad)/.exec(a)||/(iphone)/.exec(a)||/(android)/.exec(a)||/(windows phone)/.exec(a)||/(win)/.exec(a)||/(mac)/.exec(a)||/(linux)/.exec(a)||/(cros)/i.exec(a)||[];return{browser:b[3]||b[1]||"",version:b[2]||"0",platform:c[0]||""}},c=a.uaMatch(b.navigator.userAgent),d={},c.browser&&(d[c.browser]=!0,d.version=c.version,d.versionNumber=parseInt(c.version)),c.platform&&(d[c.platform]=!0),(d.android||d.ipad||d.iphone||d["windows phone"])&&(d.mobile=!0),(d.cros||d.mac||d.linux||d.win)&&(d.desktop=!0),(d.chrome||d.opr||d.safari)&&(d.webkit=!0),d.rv){var e="msie";c.browser=e,d[e]=!0}if(d.opr){var f="opera";c.browser=f,d[f]=!0}if(d.safari&&d.android){var g="android";c.browser=g,d[g]=!0}d.name=c.browser,d.platform=c.platform,a.browser=d}(jQuery,window);


// ------------------------------
// Variables
// ------------------------------

// AutoCollapse 
// Doesn't matter how many items you many have in the header, it stays responsive :3
// Just hardcode the height of the header
var headerHeight = 50; // Also have the same height in @navbar-height in variables.less

var vFSLayout; //for Stretch Sidebars

// ------------------------------
// =UTILITY BELT
// Psst: Search for '=u' to come straight here. You're welcome.
// ------------------------------
var Utility = {
    str_replace: function(c, d, b) {
        var a = c.split(d);
        return a.join(b);
    },
    str_exists: function(b, c) {
        var a = b.split(c);
        if (a[0] === b) {
            return false;
        } else {
            return true;
        }
    },
    getViewPort: function() {
        var e = window, a = 'inner';
        if (!('innerWidth' in window)) {
            a = 'client';
            e = document.documentElement || document.body;
        }
        return {
            width: e[a + 'Width'],
            height: e[a + 'Height']
        };
    },
    getSidebarViewportHeight: function () {
        var h;
        if ($('body').hasClass('infobar-offcanvas')) {
        //if (($('body').hasClass('infobar-offcanvas'))  || ($('body').hasClass('infobar-offcanvas')) ) {
          h = $(window).height();
        } else {
            h = $(window).height() - headerHeight;
        }
        return h;
    },
    sidebar_resizing: function() {
        if ($('#topnav').hasClass('navbar-fixed-top')) {
            $('.static-sidebar').css('top', headerHeight + 'px');
        } else {
            var scr = $('body').scrollTop();

            $('.static-sidebar').css('top', '0px');


            if (scr < headerHeight) {
                $('.static-sidebar').css('top',(headerHeight - scr) + 'px');
            } else {
                $('.static-sidebar').css('top','0px');
            }
        }
    },
    resizePageHeight: function() {
        var v = Utility.getViewPort().height;
        var f = $('footer').height();
        var h = 0;


       if ($('#layout-fixed').hasClass('ui-layout-container')) {
           var f = $('footer').height();
            $('.fixed-content-wrapper').height( $('.ui-layout-center').height() - f + 20 );

       } else {
            var c = $("#wrapper").height();

            if ($('#topnav').hasClass('navbar-fixed-top')) {
               h = headerHeight;
            }

            if (c < v) {
                $("#wrapper").height(v-h+f-20);
            }
       }

    },
    getBrandColor: function (name) {
        // Store Brand colors in JS so it can be called from plugins
        var brandColors = {
            'default':      '#ecf0f1',
            'gray':         '#aaa',

            'inverse':      '#95a5a6',
            'primary':      '#3498db',
            'success':      '#2ecc71',
            'warning':      '#f1c40f',
            'danger':       '#e74c3c',
            'info':         '#1abcaf',
            
            'brown':        '#c0392b',
            'indigo':       '#9b59b6',
            'orange':       '#e67e22',
            'midnightblue': '#34495e',
            'sky':          '#82c4e6',
            'magenta':      '#e73c68',
            'purple':       '#e044ab',
            'green':        '#16a085',
            'grape':        '#7a869c',
            'toyo':         '#556b8d',
            'alizarin':     '#e74c3c'
        };

        if (brandColors[name]) {
            return brandColors[name];
        } else {
            return brandColors['default'];
        }
    },
    toggle_leftbar: function() {
        var menuCollapsed = localStorage.getItem('collapsed_menu');
        
        try {
            vFSLayout.toggle('west');
        } catch (e) {
            $('body').toggleClass('sidebar-collapsed');
        }

        if (menuCollapsed == "true")
            localStorage.setItem('collapsed_menu', "false");
        else if (menuCollapsed == "false")
            localStorage.setItem('collapsed_menu', "true");
        
        setTimeout(function(){                  // wait 500ms before calling resize
            $(window).trigger('resize');        // so toggle happens faster instead of
        }, 500);                                // sticking out
    },
    toggle_rightbar: function() {
        try {
            vFSLayout.toggle('east');
        } catch (e) {
            if ($('body').hasClass('infobar-overlay')) {
                $('.infobar-wrapper').css('transform','');
            }

            $('body').toggleClass('infobar-active');

            //in layout-boxed pages, toggle visibility instead of animation
            if ($('body').hasClass('layout-boxed')) {
                Utility.rightbarRightPos();
            }
            Utility.rightbarTopPos();
        }
    },
    rightbarTopPos: function() {
    var scr = $('body').scrollTop();

        if ($('body').hasClass('infobar-overlay')) {
            if ($('body>header, body.horizontal-nav>#wrapper>header').hasClass('navbar-fixed-top')) {
                if ($('body.infobar-overlay').hasClass('infobar-active')) {
                    $('.infobar-wrapper').css('transform','translate(0, 50px)');
                }
            } else {
                if ($('body.infobar-overlay').hasClass('infobar-active')) {
                    if (scr < headerHeight) {
                        $('.infobar-wrapper').css('transform','translate(0, '+ (50 - scr)+ 'px)');
                    } else {
                        $('.infobar-wrapper').css('transform','translate(0, 0)');
                    }
                }
            }
        }
    },
    // -------------------------------
    // Rightbar Right Position (in layout-boxed)
    // -------------------------------
    rightbarRightPos: function() {
        //Set Right position for fixed layouts
        $('.infobar-wrapper').css('right','0').hide();

        if ($('body').hasClass('layout-boxed')) {
            var $pc = $('#wrapper');
            var ending_right = ($(window).width() - ($pc.offset().left + $pc.outerWidth()));
            if (ending_right<0) ending_right=0;
            $('.infobar-active.infobar-overlay .infobar-wrapper').css('right',ending_right);

            $('.infobar-wrapper').show();
        }
    },
    // -------------------------------
    // Auto Collapse Large Menu
    // -------------------------------
    autocollapse: function() {
        var navbar = $('header.navbar');
        var menu = $('header.navbar .navbar-collapse');

        $('body').removeClass('topnav-collapsed');
        $('#topnav .navbar-left').addClass('in');
        $('#navbar-links-toggle').parent('li').hide();
        $(menu).insertAfter('header.navbar a.navbar-brand');


        if((navbar.innerHeight() > headerHeight) || ($(window).innerWidth()<786)) { // check if we've got 2 lines Or less than 786px

            $('body').addClass('topnav-collapsed');
            $('#topnav .navbar-left').removeClass('in');
            $('#navbar-links-toggle').parent('li').show();

            navbar.append(menu.detach());
        }
    }
    
};
// ------------------------------
// =/U
// ------------------------------


