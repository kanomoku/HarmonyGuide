//1. 下载axios： Alt+F12 → 执行 ohpm install @ohos/axios
//2. 导入axios
import axios, { AxiosResponse } from '@ohos/axios'

class mockDataList{
  list:Array<mockData>=[]
}
class mockData{
  originName:string=''
  messageIconUrl:string=''
}
@Entry
@Component
struct Page_axios {
  @State mockDataList:Array<mockData>=[]
  @State dataBody:mockDataList=new mockDataList()

  url = 'http://rap2api.taobao.org/app/mock/293606/api/chat/list';
  build() {
    Row() {
      Column() {
        Button('get axiosData').width(160).height(60)
          .onClick(()=>{
            this.getAxiosData()
          })

        ForEach(this.mockDataList,(item:mockData)=>{
          Text(item.originName)
        })
      }.width('100%')
    }.height('100%')
  }

  getAxiosData(){
    //3. axios发起请求
    axios.get(this.url)
      .then((res:AxiosResponse)=>{
        //4. axios获取结果
        // res.data
        AlertDialog.show({message:JSON.stringify(res.data)})
        this.dataBody=res.data
        this.mockDataList=this.dataBody.list
      })
  }
}