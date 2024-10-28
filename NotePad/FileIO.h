#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QQmlEngine>
#include <QFile>
#include <QTextStream>

class FileIO : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit FileIO(QObject *parent = nullptr);
    Q_INVOKABLE QString read(const QString filename);
    Q_INVOKABLE void write(QString filename, QString input);

signals:
};

#endif // FILEIO_H
