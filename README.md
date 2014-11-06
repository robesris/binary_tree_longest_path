binary_tree_longest_path
========================
    
    git clone https://github.com/robesris/binary_tree_longest_path.git
    cd binary_tree_longest_path
    irb

(within irb console)

    load './node.rb'
    node = Node.new(nil, 4)       # This will create a semi-random tree and print out the paths to each node.  
                                  # The second arg specifies the maximum depth.  
                                  # Note that at the moment the nodes are named using upper or lowercase letters so
                                  # it may throw an error if you try to create a tree with more than 52 nodes
                              
    node.find_longest_path


Sample run
==========
    2.1.1 :031 > node = Node.new(nil, 3);nil
    a
    a->b
    a->b->c
    a->b->c->d
    a->b->c->e
    a->f
    a->f->g
    a->f->g->h
    a->f->g->i
    a->f->j
    a->f->j->k
    a->f->j->l
     => nil
    2.1.1 :032 > node.find_longest_path
    e->l
    6 steps
