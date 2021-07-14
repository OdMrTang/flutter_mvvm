flutter mvvm 框架
主要目录：
    commons 网络层、路由等
    models 数据模型层，主要是一些api模型
    providers provider相关类，以及基类相关封装操作
    service 定义的所有api相关操作类
    uis 界面层，所有ui绘制
    view_model vm中间层，处理接口请求返回操作，以及一些其它逻辑处理。定义类基类相关封装

界面层通过view_model处理逻辑，然后通过provider进行刷新操作。

其它相关：
