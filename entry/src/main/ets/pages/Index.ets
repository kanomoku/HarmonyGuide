import CommonConstants from '../common/constant/CommonConstants';
import TargetInfo from '../components/TargetInfo';

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
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      //2.目标信息
      TargetInfo({
        currentTarget: this.currentTarget,
        totalTarget: this.totalTarget
      })
      //添加子目标按钮
      Blank()
      Button('添加子目标')
        .operateButtonStyle()
        .margin({ bottom: 12 })
        .onClick(() => {
          //修改父组件的数据
          this.totalTarget++
        })
    }
    .height('100%')
    .width('100%')
    // .backgroundColor(CommonConstants.COLOR_PAGE_BGC) //  正常调用
    // .bgColor() //全局调用
    .bgColorInner() // 组件内调用
    .padding(16) //内边距
  }
}

@Styles
function bgColor() {
  .backgroundColor(CommonConstants.COLOR_PAGE_BGC)
}

@Extend(Button)
function operateButtonStyle() {
  .width('156vp')
  .height(CommonConstants.HEIGHT_TARGET)
  .fontSize(CommonConstants.FONT_SIZE_MID)
  .fontColor(CommonConstants.COLOR_BLUE)
  .backgroundColor(CommonConstants.COLOR_BTN_BGC)
}

@Extend(Text)
function opacityTextStyle() {
  .fontSize(CommonConstants.FONT_SIZE_SMALL)
  .fontColor(CommonConstants.COLOR_FONT)
  .opacity(CommonConstants.FONT_OPACITY)
}

@Extend(Text)
function opacityTextStyle2(size: number) {
  .fontSize(size)
  .fontColor(CommonConstants.COLOR_FONT)
  .opacity(CommonConstants.FONT_OPACITY)
}