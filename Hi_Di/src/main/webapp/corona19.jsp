<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

import json
from datetime import datetime
import requests


def format_number(number):
    return '{:,d}'.format(number)


def get_country_data(country):
    country_data_url = "https://corona.lmao.ninja/countries/" + country
    res = requests.get(country_data_url).text
    country_corona_info = json.loads(res)
    print("[ %s Corona Data ]" % country)
    print("추가 확진자: +%s" % format_number(country_corona_info["todayCases"]))
    print("추가 사망자: +%s" % format_number(country_corona_info["todayDeaths"]))
    print("확진자: %s" % format_number(country_corona_info["cases"]))
    print("사망자: %s" % format_number(country_corona_info["deaths"]))
    print("격리해제: %s" % format_number(country_corona_info["recovered"]))
    print("격리중: %s" % format_number(country_corona_info["active"]))
    return country_corona_info


def get_global_data():
    global_data_url = "https://corona.lmao.ninja/all"
    res = requests.get(global_data_url).text
    country_corona_info = json.loads(res)
    print("[ Global Corona Data ]")
    print("확진자: %s" % format_number(country_corona_info["cases"]))
    print("사망자: %s" % format_number(country_corona_info["deaths"]))
    print("격리해제: %s" % format_number(country_corona_info["recovered"]))
    print("(%s 기준)" % datetime.fromtimestamp(country_corona_info["updated"]/1000.0))
    return country_corona_info


def main():
    get_global_data()
    print()
    get_country_data('Korea')


if __name__ == '__main__':
    main()

</body>
</html>