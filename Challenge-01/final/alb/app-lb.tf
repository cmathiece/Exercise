
# creating Load balancer and attaching to the targetgroup
#
resource "aws_lb" "elb" {
  name               = var.lb_name
  internal           = var.is_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.web-sg.id
  subnets            = var.subnets
}

resource "aws_lb_target_group" "elb" {
  name     = var.tg_name
  port     = var.port
  protocol = "HTTP"
  vpc_id   = var.vpc_id 
}

resource "aws_lb_target_group_attachment" "elb-attach-01" {
  target_group_arn = aws_lb_target_group.elb.arn
  target_id        = var.instance1_id
  port             = var.port

  depends_on = [
   	var.instance1 
  ]
}

resource "aws_lb_target_group_attachment" "elb-attach-02" {
  target_group_arn = aws_lb_target_group.elb.arn
  target_id        = var.instance2_id
  port             = var.port

  depends_on = [
   	var.instance2 
  ]
}

resource "aws_lb_listener" "elb_listener" {
  load_balancer_arn = aws_lb.elb.arn
  port              = var.port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb.arn
  }
}
