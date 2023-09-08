provider "aws" {
    region = var.region
}

resource "aws_iam_policy" "policy_1" {
    name = var.policy_1
    policy = "${file ("policy_1.json")}"
}

resource "aws_iam_role" "role_1" {
    name = var.role_1
    assume_role_policy = "${file ("role_1.json")}"
}
resource "aws_iam_policy_attachment" "attach_iam_policy" {
    name = "attach_iam_policy_to_iam_role"
    roles = ["${aws_iam_role.role_1.name}"]
    policy_arn = "${aws_iam_policy.policy_1.arn}"
}