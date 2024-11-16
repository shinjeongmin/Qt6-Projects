#ifndef MUSICCHARTSEARCHMODEL_H
#define MUSICCHARTSEARCHMODEL_H

#include <QObject>
#include <QQmlEngine>

class MusicChartSearchModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit MusicChartSearchModel(QObject *parent = nullptr);

signals:
};

#endif // MUSICCHARTSEARCHMODEL_H
