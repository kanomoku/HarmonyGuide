import { router } from '@kit.ArkUI'

@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("Back")
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear(): void {
    console.log("FirstPage----------aboutToAppear2")
  }

  aboutToDisappear(): void {
    console.log("FirstPage----------aboutToDisappear2")
  }

  onPageShow(): void {
    console.log("FirstPage----------onPageShow2")
  }

  onPageHide(): void {
    console.log("FirstPage----------onPageHide2")
  }

  onBackPress(): boolean | void {
    console.log("FirstPage----------onBackPress2")
  }
}