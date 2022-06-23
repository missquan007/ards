from inspect import Parameter
import xgboost as xgb
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from matplotlib import pyplot as plt
import scikitplot as skp

## 把所有的相同类别的特征编码为同一个值
def get_mapfunction(x):
    mapp = dict(zip(x.unique().tolist(),
         range(len(x.unique().tolist()))))
    def mapfunction(y):
        if y in mapp:
            return mapp[y]
        else:
            return -1
    return mapfunction


if __name__ == "__main__":
    # 1. 载入数据
    data = pd.read_csv('fig4_data.csv')
    print(data.head())

    # 2. 对类别特征编码   
    numerical_features = [x for x in data.columns if data[x].dtype == np.float]
    category_features = [x for x in data.columns if data[x].dtype != np.float]
    for i in category_features:
        data[i] = data[i].apply(get_mapfunction(data[i]));
    print(data.head())
    
    # 3. 准备训练集和测试集
    Y = np.array(data['ards_group'])
    X = np.array(data[[x for x in data.columns if x != 'ards_group']])
    x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size = 0.2, random_state = 1224)
    print(x_train.shape)

    # 4. 训练 
    from xgboost.sklearn import XGBClassifier
    from sklearn import metrics
    from sklearn.model_selection import cross_val_score
    from xgboost import cv

    # Xgboost的参数及调参 
    # https://blog.csdn.net/iyuanshuo/article/details/80142730
    # https://blog.csdn.net/qq_43468807/article/details/106238362
    # https://blog.csdn.net/u010657489/article/details/51952785?

    # 4.1 定义模型 
    clf = XGBClassifier(n_estimators=25)

    # 4.2 使用5折交叉验证评估模型参数
    params = {
        'eta': [0.3],
        'max_depth': [6],
        'n_estimators': [25],
        'min_child_weight': [1, 2]     
    }
    gsearch = GridSearchCV(clf, param_grid=params, scoring='accuracy', cv=5)
    gsearch.fit(x_train, y_train)
    print("Best score: %0.3f" % gsearch.best_score_)

    clf = gsearch.best_estimator_

    # 5. 评估  
    train_predict = clf.predict(x_train)
    test_predict = clf.predict(x_test) 
    test_predict_proba=\clf.predict_proba(x_test)
    print('The train accuracy of the XGBoost is:',metrics.accuracy_score(y_train,train_predict))
    print('The test accuracy of the XGBoost is:',metrics.accuracy_score(y_test,test_predict))

    # 6. 模型校准曲线绘制
    #probas_list = [rf_probas, lr_probas, nb_probas, sv_scores]
    clf_names='Training'
    probas_list=[test_predict_proba]
    skp.metrics.plot_calibration_curve(y_test, probas_list=probas_list,clf_names=clf_names,n_bins=10)
    plt.show()
