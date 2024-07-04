import CommonConstants from '../common/constant/CommonConstants'
import DataModel, { TaskItemBean } from '../viewmodel/DataModel'

class Contact{
  name:string
  time:string

  constructor(name:string,time:string) {
    this.name=name
    this.time=time
  }
}
@Component
export  default  struct TargetList {
  @Link targetData: Array<TaskItemBean>;
  @State list:Array<string>=["a","B","c"]
  @State myList:Array<Contact>=[
    new Contact("jarvis",'2024/7/3'),
    new Contact("tom",'2024/7/3'),
    new Contact("tom",'2024/7/3'),
    new Contact("tom",'2024/7/3'),
    new Contact("tom",'2024/7/3'),
    new Contact("tom",'2024/7/3'),
    new Contact("tom",'2024/7/3'),
    new Contact("tom",'2024/7/3')
  ]
  build(){
    Column(){
      Row() {
        Text('子目标')
          .fontSize(CommonConstants.FONT_SIZE_MID)
          .fontWeight(CommonConstants.FONT_WEIGHT_LARGE)
          .fontColor(CommonConstants.COLOR_FONT)
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.HEIGHT_SUB_TARGET)
      .padding({
        left: CommonConstants.PADDING
      })
      //list
      List({space:10}) {
        //需要根据数据源的数量来确定列表项的内容 这个时候 就需要使用循环渲染的概念
        //复杂类型数据
        // ForEach(this.myList,(item:Contact,index:number)=>{
        //   ListItem(){
        //     // Text(item.name+index)
        //     // this.myBuilder(item.name+index)
        //     this.TargetItem(item.name,item.time)
        //   }
        // })

        ForEach(this.targetData,(item:TaskItemBean,index:number)=>{
          ListItem(){
            this.TargetItem(item.taskName,item.updateDate)
          }
          .swipeAction({
            // end:this.DeleteButton(index)
            // end:()=>{
            //   this.DeleteButton(index)
            // }
            end:{
              builder:this.DeleteButton(index)
            }
          })
        },(item:TaskItemBean)=>item.taskName)
        //简单数据类型
        // ForEach(this.list,(item:string,index:number)=>{
        //   ListItem(){
        //     Text(item+index)
        //   }
        // })
        // ListItem() {
        //   Text('北京').fontSize(24)
        // }
        //
        // ListItem() {
        //   Text('杭州').fontSize(24)
        // }
        //
        // ListItem() {
        //   Text('上海').fontSize(24)
        // }
      }
      .layoutWeight(1) //会对设置了这个属性的组件 重新分配父组件剩余空间
      .width(CommonConstants.WIDTH_TARGETLIST_COLUMN)
      .height(CommonConstants.HEIGHT_LIST)
    }
    .width(CommonConstants.WIDTH_TARGETLIST_COLUMN)
    .height(CommonConstants.HEIGHT_TARGETLIST_COLUMN)
    .margin({ top: CommonConstants.MARGIN})
  }
  //自定义构建函数 抽取封装UI 没有自定义组件那些生命周期
  @Builder myBuilder(value:string){
    Text(value)
  }
  @Builder TargetItem(targetName:string,updateDate:string){
    Row(){
      Text(targetName)
        .fontSize(CommonConstants.FONT_SIZE_MID)
        .fontColor(CommonConstants.COLOR_FONT)
        .textAlign(TextAlign.Start)
      Blank()
      Text("更新时间: ")
        .opacityTextStyle()
      Text(updateDate)
        .opacityTextStyle()
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.HEIGHT_TARGET)
    .backgroundColor(Color.White)
    .borderRadius(CommonConstants.RADIUS)
    .padding({left:CommonConstants.PADDING,
      right:CommonConstants.PADDING})
  }
  // 删除按钮样式以及逻辑
  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_delete'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(() => {
      DataModel.deleteData(index)
      //修改的子组件的数据
      this.targetData = DataModel.getData()
    })
  }
}
//代码最外层
@Extend(Text) function opacityTextStyle() { //自定义样式函数
  .fontSize(CommonConstants.FONT_SIZE_SMALL) //小号
  .fontColor(CommonConstants.COLOR_FONT) //通用颜色
  .opacity(CommonConstants.FONT_OPACITY) //透明度
}