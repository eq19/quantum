st=>start: Start|future
e=>end: End|future
op1=>operation: Input|future
op2=>operation: Output|future
sub1=>subroutine: Sub Input|current
sub2=>subroutine: Sub Output|current
cond1=>condition: Uji Input|rejected
cond2=>condition: Uji Output|approved
tes1=>inputoutput: Cek Input|invalid
tes2=>inputoutput: Cek Output|invalid

st->op1(right)->sub1
sub1(right)->cond1(yes, right)->sub2
cond1(no)->tes1(left)->sub1
sub2->cond2(yes, right)->op2
cond2(no)->tes2(left)->tes1
op2->e
