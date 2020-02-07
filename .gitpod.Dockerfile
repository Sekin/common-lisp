FROM gitpod/workspace-full-vnc
                    
USER gitpod

RUN sudo apt -q update
RUN sudo apt -y upgrade

RUN sudo apt install cl-clx-sbcl sbcl sbcl-doc sbcl-source
RUN curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
       --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
       --eval '(ql:add-to-init-file)' \
       --quit
