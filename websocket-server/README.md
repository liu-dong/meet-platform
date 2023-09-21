WebSocket

    描述：WebSocket为浏览器和服务器提供了双工异步通信功能，即浏览器可以向服务端发送消息，
        服务端也可以向浏览器发送消息。
        
    两种通信方式：
        广播式：即服务端有消息时，会将消息发送给所有连接了当前Endpoint的浏览器
        点对点式：即消息发送给特定的人

    四个事件：
        open：一旦服务器响应了WebSocket连接请求，open事件触发并建立一个连接。
            open事件对应的回调函数称作onopen。
        message：事件在接收到消息时触发，对应该事件的回调函数为 onmessage。
            除了文本，WebSocket还可以处理二进制数据，这种数据作为Blob消息或者ArrayBuffer消息处理。
            必须在读取数据之前决定用于客户端二进制输入数据的类型。其中返回的 event，event.data 为
            服务端返回的消息，其余属性为websocket返回的附带信息。
        close：在WebSocket 连接关闭时触发。一旦连接关闭，双端皆无法通信。
        error：在响应意外故障的时候触发，最错误还会导致WebSocket关闭，一般伴随的是close事件。error
            事件处理程序是调用服务器重连逻辑以及处理来自WebSocket对象的异常的最佳场所。
            
    两个属性：
        readyState：
            ws.readyState === 0;就绪
            ws.readyState === 1;已连接
            ws.readyState === 2;正在关闭
            ws.readyState === 3;已关闭
        bufferAmount：该属性的缘由是因为WebSocket向服务端传递信息时，是有一个缓冲队列的，
            该参数可以限制客户端向服务端发送数据的速率，从而避免网络饱和。
            
    两个方法：
        send:必须要在open事件触发之后才可以发送消息。除了文本消息之外，还允许发送二进制数据
        close:关闭连接用，可以加两个参数close(code,reason)，与客户端对应，code为状态码，1000这种，reason为字符串“关闭连接原因”。
