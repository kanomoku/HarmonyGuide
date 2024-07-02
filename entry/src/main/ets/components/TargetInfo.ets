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
          .width(96)
          .height(96)
          .borderRadius(12)
          .objectFit(ImageFit.Fill)
        //文字
        Column() {
          Text('直播带货销售目标')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('直播人气大大提升')
            .fontSize(14)
            .fontColor('#182431')
            .opacity(0.6)
            .margin({ top: 12 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 12 })
      }
      .width('100%')
      .backgroundColor(Color.Orange)

      //2.2整体进度
      Row() {
        //进度文字
        Column() {
          Text('整体进度').fontSize(18).fontWeight(FontWeight.Bold)
          Row() {
            Text('更新时间：').opacityTextStyle()
            Text('2024/06/28').opacityTextStyle()
          }.margin({ top: 12 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 10, left: 10, right: 10, bottom: 10 })

        //空白组件 占用父组件剩余空间
        Blank()
        //圆环
        Stack() { //堆叠布局 组件层叠在一起的
          Row() {
            Text(this.currentTarget.toString()).fontSize(14).fontColor('#007DFF')
            Text("/" + this.totalTarget).fontSize(14)
          }

          Progress({
            value: this.currentTarget,
            total: this.totalTarget,
            type: ProgressType.Ring
          }).width(48).height(48)
        }
        .onClick(() => {
          //修改页面数据
          if (this.currentTarget < this.totalTarget) {
            this.currentTarget++
          }
        })
      }
      .width('100%')
      .margin(20)
      .backgroundColor(Color.Pink)
    }
    .width('100%')
    .height(200)
    .backgroundColor(Color.Yellow)
    .borderRadius(12)
    .padding(16)
    .margin({ top: 12 })
  }
}

@Extend(Text)
function opacityTextStyle() {
  .fontSize(14)
  .fontColor('#182431')
  .opacity(0.6)
}