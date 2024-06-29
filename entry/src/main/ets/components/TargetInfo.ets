//抽取的自定义组件：目标信息
import CommonConstants from '../common/constant/CommonConstants'

//注意点：一般自定义组件都是在外部使用的，所以需要导出
@Component
export default struct TargetInfo {
  @State currentTarget: number = 1;
  @State totalTarget: number = 3;

  build() {
    Column() {
      //2.1销售目标
      Row() {
        //图片
        Image($r('app.media.zhibo'))
          .width(CommonConstants.PIC_SIZE)
          .height(CommonConstants.PIC_SIZE)
          .borderRadius(CommonConstants.RADIUS)
          .objectFit(ImageFit.Fill)
        //文字
        Column() {
          Text('直播带货销售目标')
            .fontSize(CommonConstants.FONT_SIZE_MID)
            .fontWeight(FontWeight.Bold)
          Text('直播人气大大提升')
            .fontSize(CommonConstants.FONT_SIZE_SMALL)
            .fontColor(CommonConstants.COLOR_FONT)
            .opacity(CommonConstants.FONT_OPACITY)
            .margin({ top: CommonConstants.MARGIN })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: CommonConstants.MARGIN })

      }
      .width(CommonConstants.FULL_WIDTH)

      //2.2整体进度
      Row() {
        //进度文字
        Column() {
          Text('整体进度')
            .fontSize(CommonConstants.FONT_SIZE_MID)
            .fontWeight(FontWeight.Bold)
          Row() {
            Text('更新时间：')// .opacityTextStyle(30)
              .opacityTextStyle()
            Text('2024/06/28')// .opacityTextStyle(40)
              .opacityTextStyle()
          }.margin({ top: CommonConstants.MARGIN_UPDATE_TIME })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: CommonConstants.MARGIN })

        //空白组件 占用父组件剩余空间
        Blank()
        //圆环
        Stack() { //堆叠布局 组件层叠在一起的
          Row() {
            Text(this.currentTarget.toString())
              .fontSize(CommonConstants.FONT_SIZE_SMALL)
              .fontColor(CommonConstants.COLOR_BLUE)
            Text("/" + this.totalTarget)
              .fontSize(CommonConstants.FONT_SIZE_SMALL)
          }

          Progress({
            value: this.currentTarget,
            total: this.totalTarget,
            type: ProgressType.Ring
          })
            .width(CommonConstants.PROGRESS_SIZE)
            .height(CommonConstants.PROGRESS_SIZE)
        }
        .onClick(() => {
          //修改页面数据
          if (this.currentTarget < this.totalTarget) {
            this.currentTarget++
          }

        })

      }
      .width(CommonConstants.FULL_WIDTH)
      .margin(CommonConstants.MARGIN)
    }
    .width(CommonConstants.WIDTH_TARGETINFO_COLUMN)
    .height(CommonConstants.height_TARGETINFO_COLUMN)
    .backgroundColor(Color.White)
    .borderRadius(CommonConstants.RADIUS)
    .padding(CommonConstants.PADDING)
    .margin({ top: CommonConstants.MARGIN })
  }
}

@Extend(Text)
function opacityTextStyle() {
  .fontSize(CommonConstants.FONT_SIZE_SMALL)
  .fontColor(CommonConstants.COLOR_FONT)
  .opacity(CommonConstants.FONT_OPACITY)
}