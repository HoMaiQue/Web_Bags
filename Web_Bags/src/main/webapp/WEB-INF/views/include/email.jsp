<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="subscribe-form" style="padding: 40px 0 60px 0;">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading" style="margin-bottom: 20px;">
            <div class="line-dec"></div>
            <h1>ĐĂNG KÝ ĐỂ NHẬN ƯU ĐÃI</h1>
          </div>
        </div>
        <div class="col-md-8 offset-md-2">
            <div class="main-content">
              <p>Rất nhiều voucher,  ưu đãi hấp dẫn đang chờ bạn hãy đăng ký ngay</p>
              <div class="container">
          		
                <form id="subscribe" action="send.htm" method="post">
               
                  <div class="row">
                    <div class="col-md-7">
                      <fieldset>
                        <input name="to" type="text" class="form-control" id="email" 
                        onfocus="if(this.value == 'Your Email...') { this.value = ''; }" 
                    	onBlur="if(this.value == '') { this.value = 'Your Email...';}"
                    	value="Your Email..." required="">
                      </fieldset>
                    </div>
                    <div class="col-md-5">
                      <fieldset>
                        <button  id="form-submit" class="button">Subscribe Now!</button>
                      </fieldset>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>