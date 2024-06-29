// import CommonConstants from '../common/constant/CommonConstants';
import CommonConstants from '../common/constant/CommonConstants';
import TargetInfo from '../components/TargetInfo';

//需求1：练习State装饰器：点击Statck 当前进度+1
//雪球2：练习Prop装饰器：父（State）传递子（Prop）传递数据
//    2.1抽取TargetInfo子组件
//    2.2 父组件向TargetInfo传递数据
//    2.3 父组件添加子目标，修改数据 观察子组件数据变化
//        Prop(单向同步)
//        父组件修改数据 会同步到子组件
//        子组件修改数据 父组件数据不同步
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State currentTarget: number = 1;
  @State totalTarget: number = 3;

  @Styles
  bgColorInner(){
    .backgroundColor(CommonConstants.COLOR_PAGE_BGC)
  }

  build() {
    Column() {
      //1.工作目标标题
      Text('工作目标' + this.currentTarget + "/" + this.totalTarget)
        .fontSize(CommonConstants.FONT_SIZE_LARGE)
        .fontWeight(FontWeight.Bold)
        .width(CommonConstants.FULL_WIDTH)

      //2.目标信息
      TargetInfo({
        currentTarget: this.currentTarget,
        totalTarget: this.totalTarget
      })
      //添加子目标按钮
      Blank()
      Button('添加子目标')
        .oprateButtonStyle()
        .margin({
          bottom: CommonConstants.MARGIN
        })
        .onClick(() => {
          //修改父组件的数据
          this.totalTarget++
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