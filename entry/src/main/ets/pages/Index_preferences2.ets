import dataPreferences from '@ohos.data.preferences';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index_preferences2 {
  @State message: string = 'Hello World';
  private context:common.UIAbilityContext = getContext(this) as common.UIAbilityContext
  private preferencesInstance: dataPreferences.Preferences =  dataPreferences.getPreferencesSync(this.context, { name: 'myStore' });

  aboutToAppear(): void {
    let result = this.preferencesInstance.getSync("messageKey","默认值1")
    this.message = String(result)
  }

  build() {
    Row() {
      Column() {
        TextInput({text:this.message}).fontSize(20).fontWeight(FontWeight.Bold)
          .onChange((value)=>{
            this.message = value
          })
        Button("保存")
          .onClick(()=>{
            this.preferencesInstance.putSync('message', this.message);
            this.preferencesInstance.flush()
            AlertDialog.show({message:"保存成功"})
          })

        Button("读取").onClick(() => {
          let result = this.preferencesInstance.getSync("messageKey","默认值2")
          this.message = String(result)//获取到的数据不是String，需要转换一下
          AlertDialog.show({message:this.message})
          console.log("test",result)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}