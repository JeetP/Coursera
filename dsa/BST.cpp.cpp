#include<bits/stdc++.h>
using namespace std;
class node{
	public:
	node* left = NULL;
	node* right = NULL;
	node* parent = NULL;
	int data;
};
node* tree_search(node* root,int k){
	if(root == NULL || k == root->data){
		return root;
	}
	if(k<root->data){
		return tree_search(root->left,k);
	}
	else{
		return tree_search(root->right,k);
	}
}
node* iterative_tree_search(node* root,int k){
	while(root != NULL){
		if(k == root->data){
			return root;
		}
		if(k<root->data){
			root = root->left;
		}
		else{
			return root = root->right;
		}
	}
}
node* tree_min(node* root){
	while(root->left != NULL)
		root = root->left;
	return root;
}
node* tree_max(node* root){
	while(root->right != NULL)
		root = root->right;
	return root;
}
node* successor(node* root){
	if(root->right!=NULL){
		return tree_min(root->right);
	}
	node* parent = root->parent;
	while(parent != NULL && root == parent->right){
		root = parent;
		parent = parent->parent;
	}
	return parent;
}
node* predecessor(node* root){
	if(root->left!=NULL){
		return tree_max(root->left);
	}
	node* parent = root->parent;
	while(parent != NULL && root == parent->left){
		root = parent;
		parent = parent->parent;
	}
	return parent;
}
void tree_insert(node* root,node* k){
	node* previous;
	node* current = root;
	while(current != NULL){
		previous = current;
		if(k->data < root->data){
			current = current->left;
		}
		else{
			current = current->right;
		}
	}
	k->parent = previous;
	if(current==NULL){
			root = k;
	}
	else if(k->data < previous->data){
		previous->left = k;
	}
	else{
		previous->right = k;
	}
}
void recursive_insert(node* root,node* k){
	if(root == NULL){
		return;
	}
	if(root->data > k->data){
		recursive_insert(root->left,k);
		root->left = k;
		k->parent = root;
	}
	else{
		recursive_insert(root->right,k);
		root->right = k;
		k->parent = root;
	}
}
void recursive_tree_insert(node* root,node* k){
	if(root == NULL){
		root = k;
	}
	else{
		recursive_insert(root,k);
	}
}
void transplant(node* root, node* u, node* v){
	if(u->parent == NULL){
		root=v;
	}
	else if(u == u->parent->left){
		u->parent->left = v;
	}
	else
		u->parent->right = v;
	if(v!=NULL){
		v->parent = u->parent;
	}
}

void tree_delete(node* root, node* z){
	if(z->left==NULL){
		transplant(root,z,z->left);
	}
	else if(z->right==NULL){
			transplant(root,z,z->right);
	}
	else{
		node* y = tree_min(z->right);
		if(y->parent!=z){
			transplant(root,y,y->right);
			y->right = z->right;
			y->right->parent = y;
		}
		transplant(root,z,y);
		y->left = z->left;
		y->left->parent = y;
	}
}
int main(int argc, char const *argv[]){
	int n;
	return 0;
}