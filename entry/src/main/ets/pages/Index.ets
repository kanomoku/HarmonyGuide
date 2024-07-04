// import CommonConstants from '../common/constant/CommonConstants';
import CommonConstants from '../common/constant/CommonConstants';
import getCurrentTime from '../common/utils/DateUtil';
import TargetInfo from '../components/TargetInfo';
import TargetList from '../components/TargetList';
//默认导出（dafault修饰的） 按需导出（只有export 需要大括号 es6解构）
import DataModel, { TaskItemBean } from '../viewmodel/DataModel';

//需求1：练习State装饰器：点击Statck 当前进度+1
//雪球2：练习Prop装饰器：父（State）传递子（Prop）传递数据
//    2.1抽取TargetInfo子组件
//    2.2 父组件向TargetInfo传递数据
//    2.3 父组件添加子目标，修改数据 观察子组件数据变化
//        Prop(单向同步)
//        父组件修改数据 会同步到子组件
//        子组件修改数据 父组件数据不同步
//需求3： 练习Link装饰器：父（State）传递子（Link）传递数据 双向Ui同步
//     3.1 抽取TargetList子组件
//     3.2 父组件向子组件传递数据（targetData）
//     3.3 父组件修改targetData（添加子目标的方式）观察子组件是否受影响
//     3。4 子组件修改targetData（左滑删除目标） 观察父组件是否受影响
//需求：监听 targetData的数据变化 从而来修改totalTarget的值
// @Watch('fnName') 监听的某个数据A
//这个数据A发生变化的时候 就会自动调用fnName函数
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State currentTarget: number = 0;
  @State totalTarget: number = 0;
  @State @Watch('targetDataChange') targetData: Array<TaskItemBean>=DataModel.getData()

  targetDataChange(){
    this.totalTarget=this.targetData.length
  }
  @Styles
  bgColorInner(){
    .backgroundColor(CommonConstants.COLOR_PAGE_BGC)
  }

  build() {
    Column() {
      //1.工作目标标题
      Text('工作目标' + this.currentTarget + "/" + this.targetData.length)
        .fontSize(CommonConstants.FONT_SIZE_LARGE)
        .fontWeight(FontWeight.Bold)
        .width(CommonConstants.FULL_WIDTH)
      //2.目标信息
      TargetInfo({
        currentTarget: this.currentTarget,
        totalTarget: this.totalTarget
        // totalTarget: this.targetData.length
      })
      //3.任务列表
      TargetList({
        targetData:this.targetData
      })
      //4.添加子目标按钮
      Blank()
      Button('添加子目标')
        .oprateButtonStyle()
        .margin({
          bottom: CommonConstants.MARGIN
        })
        .onClick(() => {
          //修改父组件的数据
          this.totalTarget++
          //往targetData中添加TaskItemBean
          let taskName='任务'+this.totalTarget
          DataModel.addData(new TaskItemBean(taskName,getCurrentTime()))
          //修改父组件数据
          this.targetData=DataModel.getData()
        })
    }

    .height(CommonConstants.FULL_HEIGHT)
    .width(CommonConstants.FULL_WIDTH)
    // .backgroundColor(CommonConstants.COLOR_PAGE_BGC)
    // .bgColor()//全局调用
    .bgColorInner()
    .padding(CommonConstants.PADDING) //内边距
  }
}

//抽取的是某一个组件的样式
//@Extend 扩展组件的样式
// @Extend(Text) function opacityTextStyle(size:number){
//   .fontSize(size)
//   .fontColor(CommonConstants.COLOR_FONT)
//   .opacity(CommonConstants.FONT_OPACITY)
// }
@Extend(Text)
function opacityTextStyle() {
  .fontSize(CommonConstants.FONT_SIZE_SMALL)
  .fontColor(CommonConstants.COLOR_FONT)
  .opacity(CommonConstants.FONT_OPACITY)
}

//全局写法
@Styles
function bgColor() {
  .backgroundColor(CommonConstants.COLOR_PAGE_BGC)
}

@Extend(Button)
function oprateButtonStyle() {
  .width('156vp')
  .height(CommonConstants.HEIGHT_TARGET) // 高有没有无所谓
  .fontSize(CommonConstants.FONT_SIZE_MID)
  .fontColor(CommonConstants.COLOR_BLUE)
  .backgroundColor(CommonConstants.COLOR_BTN_BGC)
}