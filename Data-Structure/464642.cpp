#include <bits/stdc++.h>
using namespace std;
struct AVLTree
{
    struct Node
    {
        char data;
        int height;
        array<Node*, 2> son;
        Node() : son{nullptr, nullptr}, height(0) {}
    };
    Node *root;
    int n;
    AVLTree() : root(nullptr), n(0) {}
    int getHeight(Node *rt)
    {
        return rt == nullptr ? -1 : rt->height;
    }
    void updateHeight(Node *rt)
    {
        rt->height = 1 + max(getHeight(rt->son[0]), getHeight(rt->son[1]));
    }
    // p = 0 代表右旋
    // p = 1 代表左旋
    Node* rotate(Node *rt, int p)
    {
        Node *son = rt->son[p];
        rt->son[p] = son->son[p ^ 1];
        son->son[p ^ 1] = rt;
        updateHeight(rt);
        updateHeight(son);
        return son;
    }
    Node* insert(Node *rt, char x)
    {
        if (rt == nullptr)
        {
            rt = new Node;
            rt->data = x;
            return rt;
        }
        else
        {
            if (x < rt->data)
                rt->son[0] = insert(rt->son[0], x);
            else
                rt->son[1] = insert(rt->son[1], x);
        }
        updateHeight(rt);
        int balance = getHeight(rt->son[0]) - getHeight(rt->son[1]);
        if (abs(balance) <= 1)
            return rt;
        int kind = balance < 0;
        int sign = kind ? -1 : 1;
        if (sign * x > sign * rt->son[kind]->data)
            rt->son[kind] = rotate(rt->son[kind], kind ^ 1);
        return rotate(rt, kind);
    }
    void show(Node *rt, int depth, int p)
    {
        if (rt == nullptr)
            return;
        show(rt->son[p], depth + 1, p);
        cout << string(depth * 4, ' ') << rt->data << endl;
        show(rt->son[p ^ 1], depth + 1, p);
    }
    void preOrdered(Node *rt, int p)
    {
        if (rt == nullptr)
            return;
        cout << rt->data;
        preOrdered(rt->son[p], p);
        preOrdered(rt->son[p ^ 1], p);
    }
    void postOrdered(Node *rt, int p)
    {
        if (rt == nullptr)
            return;
        postOrdered(rt->son[p], p);
        postOrdered(rt->son[p ^ 1], p);
        cout << rt->data;
    }
    void inOrdered(Node *rt, int p)
    {
        if (rt == nullptr)
            return;
        inOrdered(rt->son[p], p);
        cout << rt->data;
        inOrdered(rt->son[p ^ 1], p);
    }
    void solve()
    {
        string s;
        cin >> s;
        for (char c : s)
            root = insert(root, c);
        cout << "Preorder: ";
        preOrdered(root, 0);
        cout << endl;
        cout << "Inorder: ";
        inOrdered(root, 0);
        cout << endl;
        cout << "Postorder: ";
        postOrdered(root, 0);
        cout << endl;
        cout << "Tree:" << endl;
        show(root, 0, 1);
    }
};
int main()
{
    AVLTree().solve();
}
