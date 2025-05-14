<%-- 
    Document   : regSuccess
    Created on : 2 Jan 2024, 4:11:44 pm
    Author     : husna
--%>
<%@page import="com.mvc.bean.RegisterBean"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
            RegisterBean user = (RegisterBean) request.getSession().getAttribute("user");
            if (user != null) {
            request.setAttribute("user",user);
    }
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Successfully</title>
        <meta charset="utf-8">
        <title>Laundry Service Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- CSS -->
        <link rel="stylesheet" href="css/style1.css">

        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;800&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            img {
                display: block;
                width: 100%;
                margin: auto;
            }
        </style>
        <style>@import "bourbon";
            .center {
                position: absolute;
                top: 50%;
                left: 50%;
                @include transform(translate(-50%, -50%));
            }
            .button {
                background-color: darkblue; /* Blue background */
                border: none; /* Remove border */
                color: white; /* White text */
                padding: 10px 20px; /* Padding */
                text-align: center; /* Center text */
                text-decoration: none; /* Remove underline */
                display: inline-block; /* Display as inline-block */
                font-size: 16px;
                /* Font size */
                font-color: white;
                margin: 4px 2px; /* Margin */
                cursor: pointer; /* Pointer cursor on hover */
                border-radius: 4px; /* Rounded corners */
            }
            .button:hover {
                background-color: white; /* Darker blue on hover */
            }
            .machine {
                @extend .center;
                width: 260px;
                height: 400px;
                .above {
                    width: 230px;
                    height: 30px;
                    margin: 0 auto -5px auto;
                    border-radius: 20px;
                    -webkit-perspective: 100px;
                    perspective: 100px;
                    &:before {
                        content: "";
                        display: block;
                        width: 220px;
                        height: 30px;
                        border: solid 12px #0e1988;
                        border-bottom: none;
                        transform: rotateX(40deg);
                        border-radius: 20px;
                        background: #deedfe;
                    }
                }
                .canvas {
                    width: 260px;
                    height: 355px;
                    border: solid 8px #0e1988;
                    border-radius: 20px;
                    overflow: hidden;
                    background: #d4e4fd;
                    box-shadow: inset 0 -12px #c2defd;
                    position: relative;
                    .header {
                        width: 100%;
                        height: 80px;
                        background: #b7d3fd;
                        .programmer {
                            position: relative;
                            width: 30px;
                            height: 30px;
                            border: solid 8px #0e1988;
                            border-radius: 100%;
                            background: #6aa2f2;
                            margin: 10px 0 0 20px;
                            float: left;
                            box-shadow: 0 5px #a3c5f9;
                            &:before {
                                content: "";
                                width: 15px;
                                height: 15px;
                                border: solid 4px #0e1988;
                                border-radius: 100%;
                                background: #96c1fd;
                                @extend .center;
                            }
                        }
                        .led {
                            position: relative;
                            width: 70px;
                            height: 23px;
                            border: solid 8px #0e1988;
                            border-radius: 5px;
                            background: #6aa2f2;
                            margin: 10px 0 0 20px;
                            float: left;
                            box-shadow: 0 5px #a3c5f9;
                            &:before {
                                content: "";
                                width: 30px;
                                height: 115%;
                                background: #99d3ba;
                                border-left: solid 8px #0e1988;
                                border-right: solid 8px #0e1988;
                                @extend .center;
                            }
                        }
                        .buttons {
                            width: 60px;
                            float: right;
                            margin: 10px 15px 0 0;
                            span {
                                float: right;
                                display: inline-block;
                                width: 13px;
                                height: 3px;
                                margin: 3px;
                                border-radius: 30%;
                                background: #96c1fd;
                                border: solid 4px #0e1988;
                                box-shadow: 0 3px #a3c5f9;
                                &:nth-child(1) {
                                    background: #fd8185;
                                }
                            }
                        }
                        .seperator {
                            width: 100%;
                            height: 22px;
                            float: left;
                            margin-top: 5px;
                            span {
                                height: 100%;
                                display: block;
                                float: left;
                                position: relative;
                                overflow: hidden;
                                &:nth-child(1) {
                                    width: 27%;
                                    &:before {
                                        content: "";
                                        width: 400px;
                                        height: 200px;
                                        border: solid 8px #0e1988;
                                        border-radius: 100%;
                                        position: absolute;
                                        bottom: 0;
                                        left: -130px;
                                    }
                                }
                                &:nth-child(2) {
                                    width: 46%;
                                    margin-top: -4px;
                                    height: 26px;
                                    &:before {
                                        content: "";
                                        width: 200px;
                                        height: 200px;
                                        border: solid 8px #0e1988;
                                        border-radius: 100%;
                                        background: #d4e4fd;
                                        position: absolute;
                                        top: 0;
                                        left: 50%;
                                        @include transform(translate(-50%, 0));
                                    }
                                }
                                &:nth-child(3) {
                                    width: 27%;
                                    &:before {
                                        content: "";
                                        width: 400px;
                                        height: 200px;
                                        border: solid 8px #0e1988;
                                        border-radius: 100%;
                                        position: absolute;
                                        bottom: 0;
                                        right: -130px;
                                    }
                                }
                            }
                        }
                    }
                    .flare {
                        position: absolute;
                        top: 85px;
                        left: 0;
                        right: 0;
                        width: 250px;
                        height: 200px;
                        margin: 0 auto;
                        span:nth-child(1) {
                            float: right;
                            position: relative;
                            top: 10px;
                            right: 30px;
                            width: 20px;
                            height: 20px;
                            overflow: hidden;
                            p {
                                display: block;
                                width: 120px;
                                height: 120px;
                                border: solid 8px #fff;
                                border-radius: 100%;
                                position: absolute;
                                top: -30px;
                                right: -15px;
                            }
                        }
                        span:nth-child(2) {
                            float: right;
                            clear: both;
                            position: relative;
                            top: 20px;
                            right: 5px;
                            width: 25px;
                            height: 65px;
                            overflow: hidden;
                            p {
                                display: block;
                                width: 160px;
                                height: 160px;
                                border: solid 8px #fff;
                                border-radius: 100%;
                                position: absolute;
                                top: -55px;
                                right: 0;
                            }
                        }
                    }
                    .body {
                        width: 140px;
                        height: 140px;
                        margin: 30px auto 0 auto;
                        position: relative;
                        box-shadow: 0 0 0 8px #0e1988, 0 0 0 24px #6aa2f2, 0 0 0 32px #0e1988;
                        border-radius: 100%;
                        background: #97fff2;
                        overflow: hidden;
                        .water {
                            width: 100%;
                            height: 100%;
                            overflow: hidden;
                            position: relative;
                            border-radius: 100%;
                            -webkit-transform: translateZ(0);
                            &:before {
                                content: "";
                                width: 120%;
                                height: 66.66%;
                                display: block;
                                background: #63f0fe;
                                position: absolute;
                                bottom: 0;
                                left: -10%;
                                z-index: 1;
                                animation: water-animation 2.4s 0s infinite linear;
                                border-top-left-radius: 100px 20px;
                                border-top-right-radius: 100px 20px;
                            }
                            &:after {
                                content: "";
                                width: 120%;
                                height: 66.66%;
                                display: block;
                                background: #49d4fd;
                                position: absolute;
                                bottom: -33.33%;
                                left: -10%;
                                z-index: 2;
                                animation: water-animation 2.4s 0.2s infinite linear;
                                border-top-left-radius: 100px 10px;
                                border-top-right-radius: 100px 10px;
                            }
                            .shark {
                                width: 128px;
                                height: 79px;
                                position: absolute;
                                top: 30px;
                                right: -100%;
                                z-index: 3;
                                background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAABPCAYAAAAjgM2qAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA/ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ1dWlkOjVEMjA4OTI0OTNCRkRCMTE5MTRBODU5MEQzMTUwOEM4IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkU3Qjc2OUEyMzIwRjExRTY4MkQ4RDE0NUI0MzM0OTc0IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkU3Qjc2OUExMzIwRjExRTY4MkQ4RDE0NUI0MzM0OTc0IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIElsbHVzdHJhdG9yIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZjZhZGIwYzUtYjBmNy1mMjQyLTkxMTAtYzdhYzNmZjU1OTM2IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOmY2YWRiMGM1LWIwZjctZjI0Mi05MTEwLWM3YWMzZmY1NTkzNiIvPiA8ZGM6dGl0bGU+IDxyZGY6QWx0PiA8cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPuaJk+WNsDwvcmRmOmxpPiA8L3JkZjpBbHQ+IDwvZGM6dGl0bGU+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+9F6WBwAAG11JREFUeNrtXWtwVFWep9wvu1M7U0WVtWvVzhemrFo/7Fq1VFk1tbVVAoYkfTsh3X2bAIEBhATHgEBcTBAEjYkzAkYQDKyjvDrpx+0EAiTpIISHRgkooIFG0VFQRBh8zTgiKCacPf/zvqdvP0JISDAfDv1Id3PP+b9+/+cd8Y93rRhxtzc0AiE0vNKsJZ1/vmt+5Nhvp69oLyxavmeWb1HLvKnL9syaFzr+30NtL//lD43457ueHUH+efDcmWECa+uZM+fvAGIXPdFe7JoRqczxBWoMX7gmxxtBOWYY4efI7Q2jbF8EntcUlsXmD7U9/urXfxwx4n9q9gwTnEv4kdP/UrKmw+OeFq3KxUTFC6VfFmGEHNOqKd//3m+G0n7zV7WPGDHvr5d+9oT//eY3x5gP7ViMJbsGpNvlDWGiWigHP6ZjAP4ZeJy+4mDhUNv7z5boVR9/fsfsdR15IOmY4KuB6C4zSlS6y8Rq3lePcs1gWgZweSL0EX+naFnbrGEGGAJr5rqDeUTaMZFzCOEZEfFzQ1PvmZgBYAKXt371o81d/zHMAIN4PRI58du8aeEqIJbhtQiBc7CUA7AzvA1UlZth9tqiWiAN8bM9+Pv+OuSaZlUNxTP52RC/sKxlPiaoAHaU0CHkYhoAXmf7QjbbjoFdWgYAxoHffarr3K+GGWCQrglTo88ASgf7nkMAHhC7nhDeYKqfEBS0AX7fzUyCyhDJ1X90dfGmQ+OG6tnc1oSv2Pfeb4DwmLA1gOolQS0i3ZTwFgF+AgMQ1d9A3nOb6RnAM6dpyVA+o9uW+I+2n/oFoHsgKIA03aXjrw1f0Ab68idtRwsfO4LWvXgBPbygg2oCb5T5+lQrcHyAtUd8/t73/2mYAQbhwsRaBAQT9pwt/prYfWbnYfmnNaGnnnkfbdr8dxSqu4w2bvqGmgT2GYPhBso0LAC0dN/zQ/2cbkviu6Y1dIB0crvu5M9zZiiY1IiWPBVH9cGrKBT8HtXVX8bPvyfMIJC+LyTCv4QRAD94IvHCw1+NHGaAQbbyHm9fC8RXJZZKf4Tafq+097Pn7kebN/4NheqvoiAmPBAfngfqvkclpfvJ5znBcxWwCL9n/H7njlvm0XReGjmx86uRni0nTd/mk6Z304lC/9ZTBRO2vGt6t54oMDd3mRMCXQXmvs9HTcSf/dkwQOH+z0dhdd0lfHniplmS+MytK5hoEQmvC10l0l5Xf4VoAHgM1l3Bj1dRHkg9eAReVe1TpsK/GfdH3s8eqH35Gt6/P6/6tUp3ya5mvI842SNmwjwPNUV8j9yrkfgmDDEKOI+u3KnRjgnVb1Sa1ulxg44B/J0XRgJXF7afvxs4GLjas/W9gombThV6Kt+ozlt64HnX4vZa4/F9a91L9q+FR77yHz+4Nq+qo9Kz5ZSZO6epmRKqgan9BkF8LrkFk6JoTe1FqvKxrQ8E8ar7jhCem4BVa87ZDlE1GcwkxPv7TAq2niwwMMHx/xt3+6Jx4rV46F5cBJcEWRBLA7eKqcoyQwKvcMBreEJxY86O5gFnAP+eT+4B4k54rnNRPiaiu7glBgeJ3S2yQS6hPEJHfHbT0hA7VcMuZdNcPVOgRonu8taz5/bvg4QA2Hts6TtoyZNdqGbNp2jLpm8J8YEhQPUDEyxe8g7zHJRrMKWb6F7YFuiXMzr0xZ0gpdmeYBxfaxcJVZsyaGUkMqIwTTaAyz7rEqaPfR9f+3g/Od84mMp+YYCJnV+OLAjEC/KxVOYvaAsQleWN0A2xCzNEpE2JqPm0jbID5++pn1Pj9SRzx5M3zMYbzOfPZrF+XYL190ArzJzTjsoxY/xx5Z9RydwDlHnMoEM+oAF5ao/OvvnYZQ/BLtx0wfVT82OJ/cjzssQyFC9HPVfp9dB9cG/H8NUxxg533RQGmBj5MNv1TMdyUFewAUDHqsRQooQcCZAsrZrsM71Z/P/k7p50/6Io2xO2mQan7wmt47UUL6KBaJaJ+86Pummqvvbd2bkT64/hs4pzd3O8Xzk7M9EMwZ44Q6Q/L5rvAK2ohrbh/5vS+cXI3gOS6OlxeU+/Xu2e1tiRCwT31sdTETUV4fW/6QTrzdIJrf6u0990QidlJNMSmohW/9QhUNU3g/jGgtYA1lJxl2rimJ03NM1INALbBySg3DyMrZ2X/pwEwrz1ttQ1vD/eH8xMAxQ2nxmdV/NmmWua1QFcAyrdpahvLknw44ZSRMFfp5NqnQg8NdtXybendK0UqV0r5fe5nSWRQC+VPMMMdOVVH6j0t56794a05r5zo4yipk7AP/z/53Zcas6wyFQ6YSEjiUCJAJf+N1+9wFgG1tIAppMyAJFyjLCzJ0aOZWHbjUGaowSpIMTwhRMQt6sX0p/KPGRSkZNM4p0CQfI6LYEbnH6HvMejgQ7fAWHAf+8qeLqj2td6JiNmMFs/uhc0J01MRRSsYxHVz9G6OGdTq1NgCatcfwhNKWlDk2e12TSgWt+gprdz/RGmCaw4mOsELwBcsfyFLQGw4Tm+hjiXXs5tIhrmtYQqcWvSarO1fuqq6KDNySyoRNMf7RLstFIzV6r3jAyYynDSMGZYuGMCiGFQBRFIT82hsmTE97Z8PBpjkC7OWFQ9M9VuWiJ2kasgeM545u92obInjqKVtefRn6Lfo3DrdRRquoYenHtQ1CU47YHSyOIaOz5h5aGKhDiAueuT+8AmwAfBTSBBBl9IXhx7NBSJ4hKvRtZ0Qru0CBwAMCei6c+Lil9FMx7ej2aWHkAz5u5LuaaX7sePB8jj5OLdVCv51fy+lQD4MtUyKrGlhxKUe+PS6JPeC7i2JBKJ7bvZcna0UPt7P70bAjiugiAVDib9/Lzl+cmAVd7kKFq4/AhaV/cNisQQWcFW+lgXvYbmLnzdWd3bzjNCrxljDT0IJBjAmGp1QGEDqCBRKaNIH0Wi6mYj0t1gi6tKQ7G7uu2C708vbUclZR2ovOoEWr7qQ7Rm0yW0euNf0NamH8Qme7NAEqw2+giv+fMwPijy2698gZatPI0qqk+i4rKDhGlsZkAhYiptoJs5GWFUiR+R2IgyTtxd0tRcsP74bGPqtg63Kf9O1DEIkidiQ/lc25b/IY4C26+RPYXaYPXgPXWjSMt1FLB+RJV/OE2RvYMgaSaQRAEndTrnLUhcmdskt/ARpQ8sTUDE7pOyyllbQYViT2dgQs+r6ETLVr1HCLG16ZogWqilBxPqOgrGulEIXotN0hWMXReP6RhA/7z4HYffVb/3svV3fF0X0eKqU2gOZkhQsU7aQQVbXE1L10zHBMxkehR7DI8QkWRCwpkPtKHKQJwx4Nxesa4yhu6he4zRvYWbe1B9+Apat/4imlBoObqB2vXHc6Zt60iZCyg89OWdhEt8cnOcQ1W/MdEey0Myp+9ApRWHiKTVMnXFicGlVH3UCWgjGiFk9w1pgxtZ8P+Fd9PnoIVWbDhHtMWD8/Zn6GlYjp6EAGyO6lnBLybzmLCGLXvyLXEtCWez67pIVk2dEVPCu2HhheUSfz/EoqGhOHhuGWUDAcCIqJPCkbpN5/bfP2Mnmru4E1W/8Al6OXKFqFurza6WYSOqBKtq2okAts1idadLbH8yQKgt0ZTAngI7fkLP1n6GypYfRebMJhsBqQQzsKsR1Q5gFeYR3ojdfMD7cJbqWanXFtnZTXIWkLgqX3oskS7cK8NAEHtuyF0Qeh9MTsbpYAjsqEWRrN3JFk4EKV++4jR6BSNQ+yH2iEVsFAcrigbQbbaTNrC/7hG/MZAMQA//OtsH3ZP6t9rA37CW+wAVYfdLHnzEJu2U+BIc6xjIbgIoqKxac4aAO35eYCLFOe7sQXWh70m6esNLX6G8SZYWg6GPtHyNAUrsjfSqHgBCgsynFSBHhiPDJHQ6YUqDzY5TaelOtL3KgapE1QlvtemM4cQoPQNqCviqb+1JwCSSyen1g50ur+oigqHGH0AKk0UzJUiLCqw0t/wQ2bsqLKARyflhbx2IX1/3HUlV8xI1W5zfp3g7NB8S702oWlbRlNBUqurW2WwWZo6K6hPagfXYVLjKCM6SnUhkWHCYC5cdRTPm7SWmZc3GL9nfuweeAWL2pTIrNxNy75RBwdMoLT8siJuIFSwNpFHCTSmOJVwHnCFgIAB8gfAPRPJB9df+6SsRd5BBH54TCPLYTNxTe3z2DVUEmS1nRgNwACzA26R0Lga/dOv27gQmSKYBdAZwer5q/eco21uX4HsDI1gDhANUk6V7IjqG0fepfgY05OKqk8SjsEXjbOdpCbtfG/g2QVg4CKxv+JGkqIEBAsErqHThGywmE7ElqngWFIQ3v3hXrE8lYVBQoWabnBAwSColTA9T2z0J4EV1z5JpAfgsoO78yVHFlZJ2FZgAJGugJN/ZVPU4xhvI3lqlhrB/nn7n6dVnkG/6LkdPAN5buOxtm7oXgBie77xOQB/UJsB6ZdO32O1rsJ+PFjWE4NPkQ5fu7BMD+Js/HQ0VKE5mIIe5F/BYW/eVo31WCZ0MBKoL/PBcxY2RMXBLMNtAMEAqsEk1XLdNq9nBrzOO4J+pWnOWeE1qjL7i6bgwcaE2+/9FNEnoKilSAemHBeVrhkMug0cpyfkt3fP8TSkKhXIh1V1x+o8hWBFsQxmBNCfp5+9JBnDyk8OoZOHrN0zYVNjjViwQmtUbLziaNc4E5EyxiaV1iVdYoeoVUqAiQ+ohJeIqziw+pfMvI28KAwAWIBEkU+ahIbaupiDhEVyXZCHZVIevAqr19V8nqEbVZXpy5YcZH7DVNjgJn0wA1JhDSPH7IdLHGYAXrELUT89aqvUCfSlRc54cAQWYCrFVG+1i2SUAhHVNPzkCv2RBHxX5c4LNZLF5e1g1hN1Oy+Z29kXTDAYmULGFfj7CbQbkH6TRPiA8RP7W1l5gMf+ILcikFJHEC6IfjLupDAD5AYIFlIAD76Dl7gc8L1l40GZHuTuY7uDVAwCvAtw/tTgDfGsIugx1wuvET4VDCPLfdo1IPdcAwABPVJ601TOoaV+moeP90hjiee7wIggq8CIFNd2rotrqF84mBX5OmsDZPUQkh0AzgxcyBpFDBQM4XUt0t92tJCle66pgAMoEl9GiJccdy7746xtx/TLuCzCmNnTkeRjBSUVJSC0uII/5RRZaX/dt0hyAk9rXUbY8hB7b60wYIFmsYLBhAac4iM4AwYhsTuEMMHPOnpQFtFBG3m8MMNE6PQ6KFg2lNk6tDuIXUlTSKux1poTT4/7hVjUbmHk6OFWNwMvW5UHLBDoGIBHA0BXSmyA7lC6TcnW97FtlAmiI6dfewLzFB2rBKyBTs3jXCXvOasyIjSqteDPBpt2YNPak1BiZHzQitQiDmfi6FiAMELwitQBmgBkle209ELoJ9m3pMvu9ORRMAUg977O3lVuxUCQsyBaqCROnNGuyCFymkTon9R9iETUVN0CV0bzyt/s/kJQkm6mHlnVAqF4rPSdqAoABeKMqMII0AZbWAURp4d8S738GgIpXqGdTy5YIMwjiS/u0Yv15ESrWs4K9jRSqDJDo5/eISBonvizsuIYml7SQKFz/RxJ7HLGIzrhQNwElcFBsAjUG6l4SQGASBjAc6iehQ3hA2sOhp8/tDcf1ejp7sWUE5U9qROvr/yrLmdQ4AY+ht/UtWSMJfl0kpKSEIZJIIomrXsQR+pZI6hZJsXBbIr6BLGquX5FefG6TS5rJ9XETQH5n+0+E8DwEDAwwo+RV4XobSt+ExAADxAC0kyUWgNZoPlPHKe3Js4bgx+vZM0LEGGWE3uAC8tlXZZ6eM5EsI5Nx+UcWv0XM0+Jn4gOSTua5fM6UKnAF1xZSvjLCqZSP4fcgCKZqAJL/Z8QPsSggMICsIdBK6rEpBsEc0AER2VMbO8QwJVMdvhBW0roWyp/SQNxDqeakexdsRb0GeKoGsAWdmD8NiB+8EbgWKf39X1DC96HvCeoj4QxSl6NbpMJKNZEQCq5jDACMsOCxI6JKK6F/EdzwBX3rVO59byDGA1BE6lLKmZ1q0bkmoEzAYwTXBSEz1QAc4EmJ6yZlW+pnwLbStDLDIRvOUQwyAOpfr4WE4hYofech83TNKTLlzUzI9m6RCgYGqHjiXRH9c2pb67dIYKoFdifXrOtyLke2V79ADRsPFOlVuJkwQSiGktQWIpKQMqdv11LIb4sDDQ2geweMALY+QdUr5WJOjACmSj+LQIRqAXAFa1af0yaZ2YdBYPc87tv36agBnxFUUPNWGakjtPXjOXWqWkQ6efawt4GiBDSNVT0gacgXyAobWmQ5t+KIlmUbmJpCKGHzsdrA3ra/502JCLAK1w0pYdACPCQMU8tsvYJqUIiVlHue7yy7JUOi8pbsXgvmQHSdqiNKBEaIiHjB4qoTSUuwnBiDo3rwKmQ1bsRWVsUlDZB/6IYikShlkUeqBcwITSU8OmooXcS8L5+XbvFmGt5pnDUxLLqnoafCFkRroS4hdwenPNhiKyHnhaeieWVq5lXAN31IVN78WAhzaJxOoJBNjXCBLuWC+cVCexZkAKWk0kOXfj5t6QIQVVx2gEqWGXTo/GW19aS86igKt6CUqel0xal6ZbIsDbeXjMN7ILFly4+J/nt19rDa+2goRBMzCZ00gRlUNCRjwJ3XRTk4TC5JmIeglqVjIYQ2/ls2Js6F3UMAI241a8WGGMi+O5nvB3QMNXOwabCBcJgAnFQ1Kgsgogk19pzB8iY3oqoXPkpopNA1gNWW3OvQNZDubYSUiCY0ikDRJ8Q6VCKSewx4ZPMs7JlHSnO1QhpR1SO6eCQTAIag/z+LoTR1EwZY9+JFWybWXhFkkVE4MDDrls4JBCbIZcMZeUtZttJ0yStjk/f0R23t0PZ+/LCNkeCzhbNaCLhUiadGC9OZArt72mMLMukaAyQecMeEydvEdQlkzqZ15Wrd0oZD/R5NotE98Qle+jyDkkdfQ1t2/CSDQw1XSXXwlBnNSUbZRHiDble6mYD9Picwv+q1SjJfQBsU4QyOLMfuGbU8zAn8wPNyhiV4KFhv70pVlZyQk4glL2IBGw/YQjVBusejSrfAPWy+IGvNjk/YcHRmQUV7LQHNLK3u8kRpL59pL/Pm1VZgAoVXgPHA0qdOJA6OEK44nZCWv3hf7S2fFAqFJHTaVUjchCHx8KyUTZM2oKdIFrR280ohHuVLpvb1eIPekZSqfA1ME5gkCWLDCSZIfc/taaD2HcawME0FJjEfa0VovuVn4y5q6HQpCN6wtXdJJlIroyqxidva+BPaGLhMppmpQSA+kkc09JqRLl/r2XtvKQOQSRjR98blsnGtiRJupbwVixOjwEGs3HBBgDQ19u/UkArLyiDYxANU8NmVGz5HD5e/ydS8NElqS7eq1WzTONkgqSyTED/uKmrsNB2ydNCy5fKHuoj5AHDsS/xNw6GfEFzFRx47jKbP2Ws3m8rQJzqbINhrj6DfBkOCPYKwMY0VWA5MEHYMHOkTvSYXx0h0jUbKukUoOd2sgFRqn6t3AJAQOwCVywtekk0VcxospVbmAgHyfNF4uti8r/mT0Rgcd5EZAtrMAKcWMrfiZcjb3IQV1c8mowrPwIq7qw5W3nIGEAmkxw+QWAEfhOSylTXLGTnqQClqP+1DJ/zTm9E8TCyoOYBcf2DHjylDsurfII4AIVdA8NBrIINI4YxmCzlN5RJZOeraxWFkbWGGIMxsPXcvjGwhA5u0ais+fMvQWspJnMVrJZldZNniDmB+zJZPRw8KBqBTxz4cB/3qbGqorCtkgRxV9anTSFIlUjiqBg0xc95+YrPpzKB28hqeZ7NRq6p02z0SK7MRaymmjdLBkeduKBQLAxx4D4ahVPxybEBBpZxYLiefWrZpJeokF3q+MNCyLj7pnW//YVCNizeWtK+FdDJHy7bWZtOu3tRBjnoOXOX6VAMi080JdArK6J1QpBIqCWNwyexLWRaM1AVPwaWE06V7qc1YMpVBHaqZsPVyWiR2QrRUBnMCbsFI989GuUq2N4PfSsPHQSRjB5acRJYw7z9kn7TBlpObqH/W6W96H3+y2ETaQZf4umHwdZ/wEtYgruKdMUy4OHcj5R1MWbCHBcT4XCbVa3ApMxsNj+1a4zDzcVDeLwBGqLke2rEDBkmrwxANDWQl1sNHbAGjVGPfnJnCctQKSSXcR+MRrhTgECZ+ms0fj+7zmcTO3msUN8X4NFYO+khvBp/3q7jLfKK6nCgeIZ91e1no3R9B+UtSRwhv+b0CgBGM4u0xig+iwt5Rzm9IMd7VckDNyWoTUqdnExY7bEjCQGfu+pe/xpJV72gy+BzevjZo2Lq0sS8Pk1oBXPKYSq5tGpt9fJ2KG+yDvSIIppgOiTuGQG97Xk1nWfa0SAcENOhc+zRDp7UIXbqx8Ln6uFXNhMAj9OHDPYRgIgcv0YY7i8BQRmGuHCp7XJ5o3Gw8ff9Nj6lYH4wzymKbYSg34CdRGmZSda9iJjmrUHhbaTXToLz1C0zVLKg5XAZBDZFfSDPZOx1yT2Xr9emmJdiT+L+XvhS1+cAERAv4go5zBAVTTdvW0a/eFNYME547sghuHeMSvZuJ+RLhUc3fHRryN40a++rX92S99MHvsqoOV2aX7m4EzEDNRSjlrF85ydRSJnuGnKdsm+GEe+2QGoMFh9DaFy+Ku4nMK+sQKl+N3CkuWDxr1bFF/XUW4969Lty6sUd+/OXYXV/cl7U2Xpr99OHqnLJ9m8dPa+yAEXGuKds7x6w6umjsWz/88ra8a9iYPV//25jmS/dkBc4aD+AD4CtLfb7u1EPZG07PfGDXpfvGNl8aPQYfxgNbzxRg09LFCywBZ6g3gyIlVmzSF4ApGpAJIn/RdrSw/C20vPq049j2XPv9eeJj935z9/Bt4wbpylpxvILchEmZza/2OfKbMahzkp3assQduniaV5n6DZpqmAEG8Xog8FEBd7X0my/Z72kks5PJKqBd2j2OuBZ44IWTpcMMMJixRfSzceOLtiWAOS7NfCCGauNdDiCUq37eMU3MCg3hdoH5GWaAQboAUN3fcflfsx/dt5knZWx3MWMulupqJnoQEVEMa4tcAiP4oihryetrhxlgKOACDA5zZjW/StveQjZi6s0uTvkInTF4NVDOlG2dg54B/vPgd8NMoGCDnOKWmKG5h/xOXoklbPKmGC7FxQQPgoDD0ljjsAYYakwApqHx/P3ZTx15NrdoeydJWml383Dq0OG3as1RY/grj1UMM8BQZ4hdF+8b/9zxRTn/u/8VUvBKbk4t71BKq3Z0xrBQ1tzd1pi3r/ximAFuN/C455t/h8DS+HWnHgJXD4AeMAdE4viCv2UShRtmgOE1zAC367r/XXTHULjO/wfDANzVq4tkYwAAAABJRU5ErkJggg==")
                                    no-repeat;
                                animation: shark-animation 7s 0s infinite linear;
                            }
                        }
                    }
                    .footer {
                        width: 100%;
                        height: 105px;
                        position: relative;
                        &:before {
                            content: "";
                            width: 0px;
                            height: 12px;
                            display: block;
                            margin-left: 10px;
                            border: solid 4px #0e1988;
                            margin-bottom: 10px;
                            border-radius: 10px;
                            position: absolute;
                            top: 35px;
                            left: 0;
                        }
                        &:after {
                            content: "";
                            width: 62px;
                            height: 0px;
                            display: block;
                            margin-left: 20px;
                            border: solid 4px #0e1988;
                            margin-bottom: 10px;
                            border-radius: 10px;
                            position: absolute;
                            bottom: 0;
                            left: 0;
                        }
                        .edge {
                            width: 16px;
                            height: 16px;
                            margin-left: 10px;
                            margin-bottom: 10px;
                            position: relative;
                            top: 79px;
                            overflow: hidden;
                            &:before {
                                content: "";
                                border-radius: 100%;
                                width: 100%;
                                height: 100%;
                                display: block;
                                border: solid 8px #0e1988;
                                position: absolute;
                                top: -100%;
                                left: 0;
                            }
                        }
                        .fix {
                            width: 0px;
                            height: 12px;
                            display: block;
                            margin-left: 10px;
                            border: solid 4px #0e1988;
                            margin-bottom: 10px;
                            border-radius: 10px;
                            position: absolute;
                            top: 62px;
                            left: 0;
                        }
                    }
                }
                .base {
                    width: 200%;
                    height: 8px;
                    @include transform(translate(-23%, 0));
                    border-bottom: solid 8px #0e1988;
                    &:before,
                        &:after {
                        content: "";
                        display: block;
                        width: 35px;
                        height: 8px;
                        background: #6aa1f0;
                        border: solid 8px #0e1988;
                        border-top: solid 5px #0e1988;
                        border-radius: 20px;
                        border-bottom-right-radius: 30px;
                        border-bottom-left-radius: 30px;
                        position: absolute;
                        top: -5px;
                    }
                    &:before {
                        left: 29%;
                    }
                    &:after {
                        left: 60%;
                    }
                }
            }

            @keyframes water-animation {
                from {
                    transform: rotate(0deg) translateX(10px) rotate(0deg);
                }
                to {
                    transform: rotate(360deg) translateX(10px) rotate(-360deg);
                }
            }

            @keyframes shark-animation {
                0% {
                    right: -100%;
                    transform: rotate(0deg) translateX(10px) rotate(0deg) rotateY(0deg);
                }
                50% {
                    right: 100%;
                    transform: rotate(360deg) translateX(10px) rotate(-355deg) rotateY(0deg);
                }
                51% {
                    right: 100%;
                    transform: rotate(360deg) translateX(10px) rotate(-355deg) rotateY(180deg)
                        scale(0.6);
                }
                100% {
                    right: -100%;
                    transform: rotate(360deg) translateX(10px) rotate(-355deg) rotateY(180deg)
                        scale(0.6);
                }
            }

            .color-scheme {
                position: absolute;
                bottom: 10px;
                right: 10px;
                span {
                    display: block;
                    width: 10px;
                    height: 10px;
                    float: left;
                }
                span:nth-child(1) {
                    background: #0e1988;
                }
                span:nth-child(2) {
                    background: #deedfe;
                }
                span:nth-child(3) {
                    background: #d4e4fd;
                }
                span:nth-child(4) {
                    background: #c2defd;
                }
                span:nth-child(5) {
                    background: #b7d3fd;
                }
                span:nth-child(6) {
                    background: #6aa2f2;
                }
                span:nth-child(7) {
                    background: #a3c5f9;
                }
                span:nth-child(8) {
                    background: #96c1fd;
                }
                span:nth-child(9) {
                    background: #99d3ba;
                }
                span:nth-child(10) {
                    background: #fd8185;
                }
                span:nth-child(11) {
                    background: #97fff2;
                }
                span:nth-child(12) {
                    background: #63f0fe;
                }
                span:nth-child(13) {
                    background: #49d4fd;
                }
                span:nth-child(14) {
                    background: #6aa1f0;
                }
            }

            .name p {
                margin-top: 1rem;
                margin-right: 150px;
            }
        </style>
    </head>
    <body>
        <!-- Navbar Start -->
        <div class="container-fluid position-relative nav-bar p-0">
            <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 pl-3 pl-lg-5">
                    <a href="" class="navbar-brand">
                        <h1 class="m-0 text-secondary"><span class="text-primary">Timur</span>Coin Laundry</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="about.html" class="nav-item nav-link">About</a>
                            <a href="service.html" class="nav-item nav-link">Services</a>
                            <a href="pricing.html" class="nav-item nav-link">Pricing</a>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Form Start -->
        <section class="container forms">

            <div class="form login">
                <div class="form-content">



                    <div class="container" style="margin-bottom:70px;">

                        <div class='machine'>
                            <div class='above'></div>
                            <div class='canvas'>
                                <div class='header'>
                                    <div class='programmer'></div>
                                    <div class='led'></div>
                                    <div class='buttons'>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                    <div class='seperator'>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class='flare'>
                                    <span>
                                        <p></p>
                                    </span>
                                    <span>
                                        <p></p>
                                    </span>
                                </div>
                                <div class='body'>
                                    <div class='water'>
                                        <div class='shark'></div>
                                    </div>
                                </div>
                                <div class='footer'>
                                    <div class='edge'></div>
                                    <div class='fix'></div>
                                </div>
                            </div>
                            <div class='base'>

                            </div>
                            <div class="button-container" style="margin-top: 1rem;">
                            <a href="Listprice.jsp" class="button">Proceed</a>
                        </div> 
                        </div>
                        <div class='color-scheme'>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>


                        <br><br><br>

                        <!-- This will be displayed above the horizontal rule -->
                        <%
                            HttpSession userSession = request.getSession(false);
                            if (session != null) {
                                String username = (String) userSession.getAttribute("username");
                        %>
                        <hr><!-- comment -->
                        <!--                    <a href="logout" class="btn btn-danger"></a>-->
                        <h2>Welcome, <%= username%>
                            <div class="name">
                                <p>You have successfully logged in!</p>
                            </div>
                        </h2>

                        <!-- Content should appear directly below the h2 -->
                        <%
                            } else {
                                response.sendRedirect("login.jsp");
                            }
                        %>
                        
                        <!--                <div style="text-align: center;">
                                            <img style="width: 600px; margin: -81.5px;" src="img/welcome.png" alt="Welcome Image">
                                        </div>
                                        <br><br>
                                        <a href="Listprice.jsp">OK</a>
                                        <br><br>
                                    </div>-->
                    </div>

                </div>

        </section>

        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-white mt-5 pt-5 px-sm-3 px-md-5">
            <div class="row pt-5">
                <div class="col-lg-3 col-md-6 mb-5">
                    <a href=""><h1 class="text-secondary mb-3"><span class="text-white">Pantai Timur</span>Coin Laundry</h1></a>
                    <p>Join our community </p>
                    <div class="d-flex justify-content-start mt-4">
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 38px; height: 38px;" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h4 class="text-white mb-4">Find us at</h4>
                    <p>Stop by and say hello! Our doors are open!</p>
                    <p><i class="fa fa-map-marker-alt mr-2"></i> PT30535, Jalan Tok Jembal, Kampung Kubang Badak, 21300 Kuala Terengganu, Terengganu</p>
                    <p><i class="fa fa-phone-alt mr-2"></i>+019-399 6854</p>
                    <p><i class="fa fa-envelope mr-2"></i>TimurCoin@example.com</p>
                </div>
                <div class="col-lg-3 col-md-6 mb-5">
                    <h4 class="text-white mb-4">Quick Links</h4>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>About Us</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Services</a>
                        <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Pricing</a>
                        <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>

                </form>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark text-white py-4 px-sm-3 px-md-5">

    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
