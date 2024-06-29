/*
 * 数据实体类
 */

/**
 * Saving and manipulating data displayed on the page.
 */
export class DataModel {

  /**
   * Saved data.
   */
  private targetData: Array<TaskItemBean> = [];

  /**
   * Get the latest data.
   */
  getData(): Array<TaskItemBean> {
    return this.targetData;
  }

  /**
   * Delete the selected data.
   *
   * @param selectArr: An array indicating whether historical data is selected.
   */
  deleteData(index:number) {
      this.targetData.splice(index, 1);
  }

  /**
   * Add data to targetData.
   *
   * @param Data of the RecordItemBean type to be added.
   */
  addData(data: TaskItemBean) {
    this.targetData.push(data);
  }


}

export default new DataModel();

/**
 * Task item entity class.
 */
export class TaskItemBean {
  /**
   * Progress value of task item.
   */
  taskName: string;

  /**
   * Update time of task item.
   */
  updateDate: string;


  /**
   * Construction method.
   *
   * @param progressValue progress value.
   * @param updateDate update time.
   */
  constructor(taskName: string, updateDate: string) {
    this.taskName = taskName;
    this.updateDate = updateDate;
  }
}