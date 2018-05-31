repo forall -c git add -A
repo forall -c git commit -m "sync to cls_v2.0_1stRelease_20180530"
repo forall -c git push origin HEAD:master
repo forall -c git tag cls_v2.0_1stRelease_20180530
repo forall -c git push origin cls_v2.0_1stRelease_20180530
