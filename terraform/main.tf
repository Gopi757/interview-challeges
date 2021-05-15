terraform {
    required_version = ">= 0.13.0"
}

variable "files" {
    type = list(map(string))
    default = [{
        name="filename0"
        content="content0"
    },{
        name="filename1"
        content="content1"
    },{
        name="filename2"
        content="content2"
    }]

    # default = [{
    #     name="filename1"
    #     content="content1"
    # },{
    #     name="filename2"
    #     content="content2"
    # }]
}

resource "local_file" "files1" {
    count    = length(var.files)
    content  = var.files[count.index].content
    filename = "./test-${var.files[count.index].name}"
}