#!/usr/bin/env python3
# -*- coding:utf-8 -*-
########################################################################
#
# Copyright (c) <<vim_template_year>> xx.com, Inc. All Rights Reserved
#
########################################################################
"""
Author  :   <<vim_template_author_name>>
E-mail  :   <<vim_template_author_email>>
Date    :   <<vim_template_date>>
Desc    :
"""

import sys
import os
import logging

CUR_DIR = os.path.dirname(os.path.abspath(__file__))
LOG_FORMAT = '''[%(levelname)s] [%(asctime)s] [%(threadName)s] [%(name)s] '''
LOG_FORMAT += '''[%(filename)s:%(funcName)s:%(lineno)d]: %(message)s'''
logging.basicConfig(
    stream=sys.stderr,
    level=logging.INFO,
    format=LOG_FORMAT
)

def main():
    pass

if __name__ == '__main__':
    main()

