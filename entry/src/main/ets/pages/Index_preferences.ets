import { common } from '@kit.AbilityKit';
import dataPreferences from '@ohos.data.preferences';

@Entry
@Component
struct Index_preferences {
  @State changeFontSize: number = 16;
  // 上下文
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext
  //1. 获取preference
  private preferencesInstance: dataPreferences.Preferences = dataPreferences.getPreferencesSync(this.context, { name: 'myStore' });

  aboutToAppear(): void {
    //4. 页面打开后，直接从preference中获取上一次的数据
    let result = this.preferencesInstance.getSync("fontSizeKey", 16)
    this.changeFontSize = Number(result)
  }

  build() {
    Column() {
      Row({ space: 10 }) {
        Text('当前进度一览').fontSize(this.changeFontSize)
      }.margin(20)

      Slider({
        value: this.changeFontSize,
        min: 14,
        max: 22,
        step: 2,
        style: SliderStyle.InSet
      })
        .showSteps(true)
        .width('75%')
        .onChange(async (value: number) => {
          this.changeFontSize = value
          //2. 保存数据
          this.preferencesInstance.putSync('fontSizeKey', this.changeFontSize);
          //3. 持久化数据
          this.preferencesInstance.flush()
        })

    }.backgroundColor('#f2f3f5').width('100%').height('100%')
  }
}
