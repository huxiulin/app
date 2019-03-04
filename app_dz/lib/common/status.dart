  /*
  *网络请求结果定义枚举
  *
  * */

  enum Status {
    READY, // 初始化
    LOADING, // 请求中
    SUCCESS, // 请求成功
    NO_RESULT, // 请求结果为空
    ERROR, // 请求失败
    NO_MORE, // 没有更多
  }

  class Response {
    static int SUCCESS = 200;
  }