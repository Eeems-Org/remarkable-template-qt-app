#pragma once

#include <QObject>
#include <QTimer>
#include <QQuickItem>
#include <epframebuffer.h>

class Controller : public QObject {
    Q_OBJECT

public:
    Controller(QObject* parent) : QObject(parent) {}
    ~Controller(){}

    Q_INVOKABLE void startup(){
        qDebug() << "Running controller startup";
        QTimer::singleShot(10, [this]{
            setState("loaded");
        });
    }
    QString state() {
        if(!getStateControllerUI()){
            return "loading";
        }
        return stateControllerUI->property("state").toString();
    }
    void setState(QString state){
        if(!getStateControllerUI()){
            throw "Unable to find state controller";
        }
        stateControllerUI->setProperty("state", state);
    }

    void setRoot(QObject* root){ this->root = root; }

private:
    QObject* root = nullptr;
    QObject* stateControllerUI = nullptr;

    QObject* getStateControllerUI(){
        stateControllerUI = root->findChild<QObject*>("stateController");
        return stateControllerUI;
    }
};
