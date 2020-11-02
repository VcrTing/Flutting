### WillPopScope
处理用户退出操作，比如双击返回键返回桌面。

### 栗子
WillPopScope(
    onWillPop: () async {
        eventBus.fire(const EventOpenCustomDrawer());
        
        // LayoutWebCustom.changeStateMenu(true);
        Navigator.of(context).pop();
        return false;
    },
    child: buildMain,
)