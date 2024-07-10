//1. 下载axios： Alt+F12 → 执行 ohpm install @ohos/axios
//2. 导入axios
import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

class DataInfo {
  list: Array<DataItem> = new Array()
  // list: Array<DataItem> = []
}

class DataItem {
  originName: string = ''
  messageIconUrl: string = ''
  describe: string = ''
  remarkName: string = ''
  messageText: string = ''
}

// 淘宝公开接口，返回的数据读不懂（测试数据）
let url = 'http://rap2api.taobao.org/app/mock/293606/api/chat/list';

@Entry
@Component
struct Page_axios {
  @State mockDataList: Array<DataItem> = []
  url = 'http://rap2api.taobao.org/app/mock/293606/api/chat/list';

  build() {
    Row() {
      Column() {
        Button('get axiosData').margin(20)
          .onClick(() => {
            this.getAxiosData()
          })
        ForEach(this.mockDataList, (item: DataItem) => {
          Text(item.originName).fontColor(Color.Red)
        })

        Button('使用Axios获取网络数据').margin(20)
          .onClick(() => {
            axiosGetHttpData();
          })
      }.width('100%')
    }.height('100%')
  }

  getAxiosData() {
    //3. axios发起请求
    axios.get(this.url)
      .then((res: AxiosResponse) => {
        //4. axios获取结果
        // res.data
        AlertDialog.show({ message: JSON.stringify(res.data) })
        this.mockDataList = res.data.list
      })
  }
}

// axios 网络请求方法
function axiosGetHttpData() {
  axios.get<DataInfo, AxiosResponse<DataInfo>, null>(url)
    .then((resp: AxiosResponse<DataInfo>) => { // 获取数据成功
      if (resp.status === 200) { // 获取正确网络数据
        AlertDialog.show({ message: JSON.stringify(resp.data.list) })
        console.log('获取数据：' + JSON.stringify(resp.data));
      } else {
        AlertDialog.show({ message: '获取失败' })
        console.log('获取数据失败！error' + JSON.stringify(resp.data));
      }
    })
    .catch((err: AxiosError) => { // 网络异常或者接口异常回调
      AlertDialog.show({ message: '获取失败' })
      console.log('获取数据失败！error' + JSON.stringify(err));
    })
}



