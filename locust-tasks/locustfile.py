import re, json

from locust import HttpUser, task
from pyquery import PyQuery as pq
#from random import randrange
class QuickstartUser(HttpUser):

    global www_url
    www_url = "https://yoongworld.shop"

    @task(1)
    def test1(self):
        # 1. 로그인화면
        self.client.get("/login", name="1-1. 로그인화면")
        resp_login_idp = self.client.get("/login/idp", name="1-2. 로그인화면-IDP")

        # 2. 로그인처리
        tree = pq(resp_login_idp.content)
        test = tree("form[id='loginForm']")
        nonce = test("input[name='nonce']").val()
        client_id = test("input[name='client_id']").val()
        resp_idp_login = self.client.post(idp_url + "/auth/j_spring_security_check", name="1. 로그인-IDP", data={
            'redirect_uri': www_url + '/j_spring_security_check?client_id=' + client_id,
            'response_type': 'id_token',
            'client_id': client_id,
            'j_username': 'scott',
            'j_password': '1234',
            'nonce': nonce
        })
