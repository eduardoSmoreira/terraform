import {
  id = "sg-0d273f9b261b57c37"
  to = aws_security_group.bia_dev
}

import {
  id = "sg-01938984afc257305"
  to = aws_security_group.bia_alb
}

import {
  id = "sg-05c5e2ca5e1becf1f"
  to = aws_security_group.bia_db
}

import {
  id = "sg-0e30ed047617ce2c8"
  to = aws_security_group.bia_ec2
}

import {
  id = "sg-04353b2f4d6425f4b"
  to = aws_security_group.bia_web
}