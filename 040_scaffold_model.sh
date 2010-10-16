source ./rrp-lib.sh
NAME='model'

function do_generate () {
    rails generate scaffold ${NAME} make_id:integer name:string url:string wikipedia:string
    rake db:migrate
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF
  validates_presence_of :name
  belongs_to :make
EOF

    $EDITOR ${MODEL}

    echo "Don't forget to edit foreign key model, if applicable" && sleep 1
    
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######

do_generate
edit_model
do_migration