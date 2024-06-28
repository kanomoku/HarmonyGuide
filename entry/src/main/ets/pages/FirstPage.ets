import { router } from '@kit.ArkUI'

@Entry
@Component
struct FirstPage {
  @State message: string = 'First Page';

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

  aboutToAppear(): void {
    console.log("FirstPage----------aboutToAppear1")
  }

  aboutToDisappear(): void {
    console.log("FirstPage----------aboutToDisappear1")
  }

  onPageShow(): void {
    console.log("FirstPage----------onPageShow1")
  }

  onPageHide(): void {
    console.log("FirstPage----------onPageHide1")
  }

  onBackPress(): boolean | void {
    console.log("FirstPage----------onBackPress1")
  }
}