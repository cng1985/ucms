package com.haoxuer.ucms.controller.front;

import java.io.Serializable;

public class VerifyVo implements Serializable {

  private String status;

  private String version;

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getVersion() {
    return version;
  }

  public void setVersion(String version) {
    this.version = version;
  }
}
