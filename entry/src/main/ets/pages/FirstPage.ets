import { router } from '@kit.ArkUI'

@Entry
@Component
struct FirstPage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('Next')
          .onClick(() => {
            router.pushUrl({
              url: "pages/SecondPage"
            })
            // router.replaceUrl({
            //   url: "pages/SecondPage"
            // })
          })
      }
      .width('100%')

    }
    .height('100%')
  }
}