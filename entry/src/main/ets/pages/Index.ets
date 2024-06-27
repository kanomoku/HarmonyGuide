@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = "Hello ArkTS!"
            this.fn()
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  fn() {
    console.log("调用了fn-----")
  }
}