#pragma mark 全局设置

#define DEBUG_VERSION YES

/*渠道编号CPId；
 1:appstore,
 2:91助手
 */
#define CPId                                @"1"
#define UMENG_SOCIAL_KEY                    @"50b42eb552701512ba0000c9"
#define UMENG_ANALYTICS_KEY                 @"521f10c756240b7543076226"
//微信
#define WEICHAT_URL                         @"wxd5abac794399f072"
//微博
#define WEIBO_URL                           @"2216981022"

#define BAIDU_MAP_KEY                       @"WlIiFHQZnUcYRtcSSAwgAG1s"


#pragma mark 宽度高度定义
#define WIDTH_LEFT                          61
#define WIDTH_CENTER                        190
#define WIDTH_RIGHT                         1024-61-190
#define HEIGHT_TOP                          64
#define HEIGHT_LEFT_BUTTON                  83
#define TAG_LEFT_BUTTON_BASE                100
#define HEIGHT_TOOLBAR                      48
#define HEIGHT_NAVIGATION_BAR               44
#define HEIGHT_SEARCH_BAR                   40
#define HEIGHT_SEGMENT_CUSTOMER             39
#define HEIGHT_TABBAR                       54



#pragma mark 语言设置
#define LANGUAGE_CN     @"zh-Hans"
#define LANGUAGE_EN     @"en"
#define LANGUAGE_JAPAN  @"ja"
#define DEVICELANGUAGE [(NSMutableArray*)[USER objectForKey:@"AppleLanguages"] objectAtIndex:0]
#define LANGUAGE LANGUAGE_CN



#pragma mark 辅助方法定义
#define SLOG if (DEBUG_VERSION) NSLog
#define PI 3.1415926535f
#define TRIM stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]
#define APP (AppDelegate*)[[UIApplication sharedApplication] delegate]
#define APP_FRAME [[UIScreen mainScreen] applicationFrame]
#define WIN_FRAME [[UIScreen mainScreen] bounds]
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)?YES:NO
#define IS_RETINA ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(768*2,1024*2), [[UIScreen mainScreen] currentMode].size) : NO)
#define USER    [NSUserDefaults standardUserDefaults]
#define NSL(a) (NSLocalizedString(a, @""))

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


#pragma mark 全局Tag范围定义
#define TAG_FOCUSITEMSVIEW                  200
#define TAG_SPECIALLISTVIEW                 201
#define TAG_TOPNAVBARBACKVIEW               300
#define TAG_TOPNAVBARLEFTBTN                301
#define TAG_NAVMENUEXPANDCOLLAPSEBTN        302
#define TAG_TOPNAVBARRIGHTBTN               303
#define TAG_TOPNAVBARMAINTITLE              304
#define TAG_TOPNAVBARBACKTITLE              305
#define TAG_TOPNAVBARLOGOICON               306

#pragma mark 全局颜色定义
#define COLOR_UI_THEME                  [UIColor colorWithRed:242./255. green:242./255. blue:242./255. alpha:1.0]
#define COLOR_UI_THEME_HIGHLIGHT        [UIColor colorWithRed:167./255. green:166./255. blue:72./255. alpha:1.0]
#define COLOR_UI_THEME_MENUHEADERBG     [UIColor colorWithRed:85./255. green:85./255. blue:85./255. alpha:1.0]
#define COLOR_UI_THEME_MENUNORMALTEXT   [UIColor colorWithRed:79./255. green:79./255. blue:79./255. alpha:1.0]
#define COLOR_UI_THEME_MENUHEADERTEXT   [UIColor colorWithRed:154./255. green:154./255. blue:154./255. alpha:1.0]
#define COLOR_UI_THEME_MENUNORMALBG     [UIColor colorWithRed:253./255. green:253./255. blue:253./255. alpha:1.0]
#define COLOR_UI_THEME_NORMALTEXT       [UIColor blackColor]
#define COLOR_UI_THEME_NAVBARTEXT       [UIColor whiteColor]
#define COLOR_UI_THEME_NAVBARBG         [UIColor colorWithRed:167./255. green:166./255. blue:72./255. alpha:1.0]
#define COLOR_UI_BG                     [UIColor colorWithRed:247./255. green:247./255. blue:247./255. alpha:1.0]
#define COLOR_UI_THEME_MENUHEADERLINE                   [UIColor colorWithRed:112./255. green:112./255. blue:112./255. alpha:0.5]
#define COLOR_UI_THEME_ACTIVITYBTNBG                    [UIColor colorWithRed:167./255. green:166./255. blue:72./255. alpha:1]
#define COLOR_UI_THEME_NAVBARBOTTOMLINE                 [UIColor colorWithRed:200./255. green:200./255. blue:200./255. alpha:1]
#define COLOR_UI_PHOTOTOPFILTERNORMALTEXT               [UIColor colorWithRed:90./255. green:90./255. blue:90./255. alpha:1]
#define COLOR_UI_COMPANYLISTHEADERBG                    [UIColor colorWithRed:242./255. green:242./255. blue:242./255. alpha:1.0]
#define COLOR_UI_COMPANYLISTHEADERTEXT                    [UIColor colorWithRed:79./255. green:79./255. blue:79./255. alpha:1.0]
#define COLOR_UI_PHOTOBOTTOMFILTERBG                    [UIColor colorWithRed:40./255. green:40./255. blue:40./255. alpha:1.0]
#define COLOR_UI_PHOTOHEADERFILTERBG                    [UIColor colorWithRed:242./255. green:242./255. blue:242./255. alpha:1.0]
#define COLOR_UI_CITYLISTHEADERBG                    [UIColor colorWithRed:153./255. green:153./255. blue:153./255. alpha:1.0]
#define COLOR_TABLE_BG              [UIColor colorWithRed:247./255. green:247./255. blue:247./255. alpha:1.0]
#define COLOR_TABLECELL_BG          [UIColor whiteColor]
#define COLOR_NAVBUTTONITEMBGCOLOR  [UIColor colorWithRed:250./255. green:84./255. blue:41./255. alpha:1]
#define COLOR_TITLE_MAIN_IN_TABLE   [UIColor colorWithRed:52./255. green:52./255. blue:52./255. alpha:1.0]
#define COLOR_TITLE_SUB_IN_TABLE    [UIColor colorWithRed:52./255. green:52./255. blue:52./255. alpha:1.0]
#define COLOR_TITLE_3RD_IN_TABLE    [UIColor colorWithRed:52./255. green:52./255. blue:52./255. alpha:1.0]
#define COLOR_DESCRITPION_TEXT      [UIColor colorWithRed:52./255. green:52./255. blue:52./255. alpha:1.0]
#define COLOR_REASON_TEXT           [UIColor colorWithRed:86./255. green:121./255. blue:186./255. alpha:1.0]


#pragma mark 全局字体定义
#define FONT_TITLE_MAIN_IN_TABLE    [UIFont boldSystemFontOfSize:14.]
#define FONT_TITLE_SUB_IN_TABLE     [UIFont systemFontOfSize:12.]
#define FONT_TITLE_3RD_IN_TABLE     [UIFont boldSystemFontOfSize:10.]
#define FONT_DESCRIPTION_TEXT       [UIFont systemFontOfSize:12.]
#define FONT_TITLE_MAIN             [UIFont boldSystemFontOfSize:14.]
#define FONT_TITLE_SUB              [UIFont systemFontOfSize:12.]



#pragma mark 服务器配置定义
#define SERVER_PATH                         @"http://ihome.cmfmobile.com:8080/sp/custom"
#define SERVER_API_PHOTOLIST_URL            @"searchpic.do?type=%@&pn=%d"
#define SERVER_API_SPECIALLIST_URL          @"getNewSpecial.do?pn=%d"

#pragma mark 程序基础配置
#define DATABASE_FILE_NAME                  @"geeko.rdb"
#define DATABASE_RESOURCE_NAME              @"geeko"
#define DATABASE_RESOURCE_TYPE              @"rdb"
#define NETWORKRETRYTIME                    2
#define BIKINGHISTORYSAVECOUNT                    2

//系统定位服务类型，1系统，2百度
#define SYSTEMLOCATIONSERVICETYPE           2




