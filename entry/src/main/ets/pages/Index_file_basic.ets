import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index_file_basic {
  private context = getContext(this) as common.UIAbilityContext;

  @Builder
  readData() {
    Text('数据读取区').margin(5)
    Column() {
      Text('安装文件路径:bundle：')
      TextInput({ text: this.context ? this.context.bundleCodeDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

    // Column() {
    //   // 本设备文件路径：应用在本设备存放持久化数据目录
    //   Text('base：')
    //   // 获取base通过NA属性，但是没有
    //   TextInput({ text: this.context ? this.context.NA : "" }).backgroundColor(Color.White).width('100%')
    // }.padding(5).alignItems(HorizontalAlign.Start)

    Column() {
      Text('数据库:database：')
      TextInput({ text: this.context ? this.context.databaseDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

    Column() {
      Text('分布式文件路径:distributedfiles：')
      TextInput({ text: this.context ? this.context.distributedFilesDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

    // 通用文件路径：图片，媒体文件，日志文件
    // 注意：获取到的是entry模块打包后的hap下的路径（7级路径），不是应用下的路径（5级路径）
    // 因为咱们得代码最终是打包到了entry的hap包下
    // /data/storage/el2/base/haps/entry/files
    Column() {
      Text('应用通用文件路径:files：')
      TextInput({ text: this.context ? this.context.filesDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

    //应用缓存路径
    // 注意：获取到的是entry模块打包后的hap下的路径（7级路径），不是应用下的路径（5级路径）
    // 因为咱们得代码最终是打包到了entry的hap包下
    // /data/storage/el2/base/haps/entry/cache
    Column() {
      Text('应用缓存文件路径:cache：')
      TextInput({ text: this.context ? this.context.cacheDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

    //Preference路径
    // 注意：获取到的是entry模块打包后的hap下的路径（7级路径），不是应用下的路径（5级路径）
    // 因为咱们得代码最终是打包到了entry的hap包下
    // /data/storage/el2/base/haps/entry/preferences
    Column() {
      Text('应用首选项文件路径	:preference：')
      TextInput({ text: this.context ? this.context.preferencesDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

    //temp路径
    // 注意：获取到的是entry模块打包后的hap下的路径（7级路径），不是应用下的路径（5级路径）
    // 因为咱们得代码最终是打包到了entry的hap包下
    // /data/storage/el2/base/haps/entry/temp
    Column() {
      Text('应用临时文件路径:temp：')
      TextInput({ text: this.context ? this.context.tempDir : "" }).backgroundColor(Color.White).width('100%')
    }.padding(5).alignItems(HorizontalAlign.Start)

  }

  build() {
    Column() {
      Column() {
        this.readData()
      }
      .width('100%')
      .height('100%')
      .padding(10)
      .backgroundColor(0xe0e0e0)
    }
  }
}