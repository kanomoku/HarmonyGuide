import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index_http {
  @State message: string = 'Hello World';
  url = 'http://rap2api.taobao.org/app/mock/293606/api/chat/list';

  build() {
    Row() {
      Column() {
        Button('get httpData')
          .width(160)
          .height(60)
          .onClick(() => {
            this.getHttpData()
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  getHttpData() {
    // 0 配置权限,module.json5追加"name":'ohos.permission.INTERNET'

    // 1. 创建网络请求对象
    let httpRequest = http.createHttp()

    // 2. 调用request方法 , 传入url等参数
    httpRequest.request(this.url,
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET

        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },

        connectTimeout: 60000, // 可选，默认为60000ms
        readTimeout: 60000, // 可选，默认为60000ms
      },
      (err: BusinessError, data: http.HttpResponse) => {
        // 3. 处理结果
        if (!err) {

          AlertDialog.show({ message: JSON.stringify(data.result) })

          // data.result为HTTP响应内容，可根据业务需要进行解析
          console.info('Result:' + JSON.stringify(data.result));
          console.info('code:' + JSON.stringify(data.responseCode));

          // data.header为HTTP响应头，可根据业务需要进行解析
          console.info('header:' + JSON.stringify(data.header));
          console.info('cookies:' + JSON.stringify(data.cookies));

          // 4. 销毁请求对象
          httpRequest.destroy();
        } else {
          console.error('error:' + JSON.stringify(err));

          // 4. 销毁请求对象
          httpRequest.destroy()
        }
      })

  }
}